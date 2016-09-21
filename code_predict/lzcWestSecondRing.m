%��������·��dayscell��ÿ���ʱ���󹹳ɵ�cell��ת��Ϊÿ����·�ĸ��Ӷ�

%% ���ݶ�ȡ
clc,clear,close all;
load('timeSpaceWestSecondRing2015q4.mat');

roadName = {'erhuan_ns','erhuan_sn','fuchengmenwaidajie_ew','fuchengmenwaidajie_we',...
    'fuxingmenneidajie_ew','fuxingmenneidajie_we','jinrongjie_ns','jinrongjie_sn',...
    'nanbeilishi_ns','nanbeilishi_sn','pinganjie_ew','pinganjie_we','taipingqiaodajie_ns',...
    'taipingqiaodajie_sn','yuetanbeijie_ew','yuetanbeijie_we','yuetannanjie_ew','yuetannanjie_we'};

roadNum = length(roadName);
symbol = cell(length(roadName),1);
speedVector = cell(roadNum,1);
for i=1:length(roadName)  %�Ա�����ѭ��
    dayscell = eval(roadName{i});   %eval�൱��ȥ������
    %dayscell������=����������=1��dayscell{k}:����=100m����Ŀ������=288������=ʱ�յ�Ԫ���ƽ���ٶ�
    dayscellInterp1 = arrayfun(@(x)speedinterp(x{:}),dayscell,'UniformOutput',false);
    dayscellInterp2 = arrayfun(@(x)speedinterp((x{:})'),dayscellInterp1,'UniformOutput',false); 
    dayscellInterp3 = arrayfun( @(x)(x{:})',dayscellInterp2,'UniformOutput',false );
    %���β�ֵȥ������0��NaN
    %dayscellInterp������=����������=1��dayscell{k}:����=100m����Ŀ������=288������=ʱ�յ�Ԫ���ƽ���ٶ�
    speedVector{i} = daycells2vector(dayscellInterp3);
    %speedVector��cellarray������=��·��������=1
    %speedVector{i}:����=������288����1=��i��·������Ӧʱ�̵�·ƽ���ٶ�  
end



  

%% ��·���ӶȺ�������
roadComplexity = zeros(9,roadNum);%����=��·�飬����=10-1=9
symbolVector = cell(9,1);
for i = 2:10
%�����ֵ��Сֵ�ֳɵ�������
symbolVector{i-1} = arrayfun( @(x)vector_to_string(x{:},i),speedVector,'UniformOutput',false);  %��speedVector(i-1)��Ϊ�������x
%symbolVector;cellarray����=���仮����9������=1
%symbolVector{i-1} ��cellarray����=��·��������=1������=i���ַ�ʱ�ĵ�·�ַ���
roadComplexity(i-1,:) = arrayfun(@(x)cal_complexity(x{:},i,1),symbolVector{i-1});
%roadComplexity;����=���仮����9������=��·��������=���Ӷ�
end
roadComplexity = roadComplexity';
%����=��·��������=���仮����9������=���Ӷ�

%% ������͹̶������Ӷȵ���
randNum = rand(1,length(speedVector{i}));
fixComplexity = zeros(9,1);
randVector = cell(9,1);
randComplexity = zeros(9,1);
for i =2:10
    fixComplexity(i-1) = cal_complexity( repmat('x',length(speedVector{i}),1),i,1 );
    
    randVector{i-1} = vector_to_string(randNum,i);
    randComplexity(i-1) = cal_complexity( randVector{i-1},i,1 );
    
end
fixComplexity = fixComplexity';
randComplexity = randComplexity';









