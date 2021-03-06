%% main scipt of prediction
clc,clear,close all;

% change here
data_source = dlmread('g:\transport_research\可预测性\高德全年数据\changan_ew_avgspeed.csv');
% data_source:rownum=many,c1=mesh,c2=roadid,c3=year,
%c4=month,c5=day,c6=nth_minute,c7=speed
[row,~] = find(data_source(:,3)==2014);
data_source(row,:) = [];
[row,~] = find(data_source(:,6)==0);
data_source(row,:) = [];
mif_folder = 'g:\transport_research\可预测性\路段选择\路段分向选择\';

% change here
link_matnmae = 'changan_ew';

load([mif_folder,link_matnmae,'.mat']);
shuffled_link = link_connect(link);
%shuffled_link: struct array:1-longlat(array),2-mesh(num),3-road_id
%4-node_start,5-node_end,6-road_length
line_longlat = plot_line_road(shuffled_link,link_matnmae);
%array:c1=long,c2=lat,r_num=num of points+1


%% calc_link_road_time
[avg_tt,tt_sum,shuffled_link] = calc_link_road_time(data_source,shuffled_link);
    % output:(1)avg_tt:cellarray,num=num of link,avg_tt(i):array(288,577),
    % content=tt of ith link;(2)tt_sum:array(288,571):content=tt of road
    %(3)shuffled_link: struct array:1-longlat(array),2-mesh(num),3-road_id
    %4-node_start,5-node_end,6-road_length,7-avgspeed

%% calc_link_param
    % change here : update bin_length,mini,maxi used for vector_to_string
for nth_link = 1:length(shuffled_link)
    tt15_tt85 = quantile(avg_tt{nth_link}(:),[0.15,0.85]);
    mini(nth_link) = tt15_tt85(1);
    maxi(nth_link) = tt15_tt85(2);
end
bin_length = 0.1;    % single = length of time(s) to discriminate symbols
interval = 1;
alpha = 1.2;

shuffled_link = calc_link_param(shuffled_link,avg_tt,bin_length,mini,maxi,interval,alpha);
    % output:(1)avg_tt:cellarray,num=num of link,avg_tt(i):array(288,577),
    % content=tt of ith link;(2)shuffled_link: struct array:1-longlat(array)
    % ,2-mesh(num),3-road_id,4-node_start,5-node_end,6-road_length,7-avgspeed
    % 8-params

%% plot link-time color map at nth_wkday
    % change here: 7 to 8 if want all year
for nth_wkday = 1:7
	plot_frag_predict(shuffled_link,nth_wkday,link_matnmae);
    close all;
end

%% calc road unreliability param
    % change here : update bin_length,mini,maxi used for vector_to_string
tt15_tt85 = quantile(tt_sum(:),[0.15,0.85]);
% mini = tt15_tt85(1);
% maxi = tt15_tt85(2);
mini = 0;
maxi = 2000;
bin_length = 20;    % single = length of time(s) to discriminate symbols
interval = 1;
alpha = 1.2;

param = calc_road_param(tt_sum,bin_length,mini,maxi,interval,alpha);

%% plot road nth_weekday-nth_5min index colormap
plot_road_predict(param,link_matnmae);
plot_road_predictnorm(param,link_matnmae);
