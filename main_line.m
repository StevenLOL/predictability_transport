%% mapinfo and gaode data to tsplot

clc,clear;
% change here
mif_folder = 'g:\transport_research\可预测性\路段选择\路段分向选择\';
mid_cnum = [1,3,4,5,6];	
	%vector:mid files cnum of [mesh,road_id,node_start,node_end,road_length]
	%beijing mid file's mid_cnum = [1,3,4,5,6]
	%tianjin mid file's mid_cnum = [1,3,9,10,13]

midmif_to_longlat(mif_folder,mid_cnum);

% change here
link_matnmae = 'changan_ew';

load([mif_folder,link_matnmae,'.mat']);

shuffled_link = link_connect(link);
%shuffled_link: struct array:1-longlat(array),2-mesh(num),3-road_id
%4-node_start,5-node_end,6-road_length
line_longlat = plot_line_road(shuffled_link,link_matnmae);
%array:c1=long,c2=lat,r_num=num of points+1

%get cube_longlat,change here
cube_length = 100;
cube_longlat = points_interp(line_longlat,cube_length);

%% use gaode data
tic;
% change here
data_source = dlmread('g:\transport_research\可预测性\测试数据\changan_ew2015070809_hy.txt',',',[0,2,495044-1,4]);
toc;
% change here
time_interval = 5;
tsstruct = dailydata_to_tsstruct(data_source(:,1), ...
			data_source(:,2:3),data_source(:,4),cube_longlat,5);
%function tsstruct = dailydata_to_tsstruct(time,longlat,speed,frag_points,time_interval)
%tsstruct:struct array,rownum=num_interval,cnum=num_roadfrag
%tsstruct(nth_interval,nth_frag):struct,f1=speed(vector)
%f2=num_stamp(num of stamp points),f3=avg_speed(NaN if none)
tsspeed = reshape(vertcat(tsstruct.avg_speed),size(tsstruct,1),size(tsstruct,2));
tsspeed(isnan(tsspeed)) = 0;
tsspeed = speedinterp(tsspeed);
tsspeed = speedinterp(tsspeed');
tsspeed = speedinterp(tsspeed);
tsspeed = tsspeed';
% up2: replace NaN

tsplot(cube_longlat,tsspeed);

