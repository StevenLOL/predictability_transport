%%CPI,����,����,��֤,��ͨ·��ָ��

%% ���ݶ�ȡ
clc,clear,close all;
stock = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��֤.xlsx',1,'D2:D170');%����=169��ѡȡ��������,��1=��Ʊ����ָ�����ӽ���Զ��
stock = flipud(stock);%����=169��ѡȡ��������,��1=��Ʊ����ָ������Զ������
disp('��ָ֤����ȡ��ϣ�');

cpi_tongbi = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\����CPIָ��.xlsx',1,'G1:G101');%����=99��ѡȡ���·�����,��1=cpi���ӽ���Զ��
cpi_tongbi = flipud(cpi_tongbi); %����=101��ѡȡ���·�����,��1=cpiͬ����������Զ������
cpi_huanbi = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\����CPIָ��.xlsx',1,'H1:H101');%����=99��ѡȡ���·�����,��1=cpi���ӽ���Զ��
cpi_huanbi = flipud(cpi_huanbi); %����=101��ѡȡ���·�����,��1=cpi������������Զ������
disp('CPI����ȡ��ϣ�');

housebj_huanbi = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��������.xlsx',1,'A2:A63'); %down8:ȫ��
housebj_huanbi = flipud(housebj_huanbi);
housebj_tongbi = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��������.xlsx',1,'B2:B63');
housebj_tongbi = flipud(housebj_tongbi);
housesh_huanbi = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��������.xlsx',1,'C2:C63');
housesh_huanbi = flipud(housesh_huanbi);
housesh_tongbi = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��������.xlsx',1,'D2:D63');
housesh_tongbi = flipud(housesh_tongbi);  %����=62.��1=����ͬ�Ȼ򻷱�ָ��
disp('����ָ����ȡ��ϣ�');

usa_unemploy = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\����ʧҵ��.xlsx',1,'C2:C81'); %��ֵʧҵ��
usa_unemploy = flipud(usa_unemploy); 
disp('usa_unemploy��ȡ��ϣ�');

usa_cpi = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\�������������ָ��.xlsx',1,'C2:C81'); %��ֵ��ۻ��ȱ仯��
usa_cpi = flipud(usa_cpi);
disp('usa_cpi��ȡ��ϣ�');

gasoline_93_price =  xlsread('g:\2015_Autumn\transport_research\��Ԥ����\�ͼ�����.xlsx',1,'E4:E79'); %93���ͼ۸�
gasoline_93_price = flipud(gasoline_93_price);
gasoline_97_price =  xlsread('g:\2015_Autumn\transport_research\��Ԥ����\�ͼ�����.xlsx',1,'G4:G79'); %97���ͼ۸�
gasoline_97_price = flipud(gasoline_97_price);
disel_price = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\�ͼ�����.xlsx',1,'I4:I79'); %����
disel_price = flipud(disel_price);
disp('�й��ͼ۶�ȡ��ϣ�');

bj_city_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',1,'E2:E2185'); 
tj_city_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',1,'E2186:E4369'); 
bj_city_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',1,'F2:F2185'); 
tj_city_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',1,'F2186:F4369'); 
bj_city_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',1,'G2:G2185'); 
tj_city_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',1,'G2186:G4369'); 
disp('���������н�ָͨ���ȡ��ϣ�');


tj_urban_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',2,'C2:C2185'); 
tj_urban_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',2,'D2:D2185'); 
tj_urban_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',2,'E2:E2185'); 
disp('����������ָͨ���ȡ��ϣ�');

tj_heping_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',3,'F2:F2184'); 
tj_heping_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',3,'G2:G2184'); 
tj_heping_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',3,'H2:H2184'); 
disp('����ƽ����ָͨ���ȡ��ϣ�');

tj_hebei_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',3,'F8737:F10920'); 
tj_hebei_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',3,'G8737:G10920'); 
tj_hebei_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',3,'H8737:H10920'); 
disp('���ӱ�����ָͨ���ȡ��ϣ�');

tj_hedong_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',3,'F2185:F4368'); 
tj_hedong_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',3,'G2185:G4368'); 
tj_hedong_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',3,'H2185:H4368'); 
disp('���Ӷ�����ָͨ���ȡ��ϣ�');

tj_hexi_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',3,'F4369:F6552'); 
tj_hexi_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',3,'G4369:G6552'); 
tj_hexi_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',3,'H4369:H6552'); 
disp('����������ָͨ���ȡ��ϣ�');

tj_hongqiao_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',3,'F10921:F13104'); 
tj_hongqiao_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',3,'G10921:G13104'); 
tj_hongqiao_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',3,'H10921:H13104'); 
disp('����������ָͨ���ȡ��ϣ�');

tj_nankai_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',3,'F6553:F8736'); 
tj_nankai_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',3,'G6553:G8736'); 
tj_nankai_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',3,'H6553:H8736'); 
disp('����Ͽ�����ָͨ���ȡ��ϣ�');

tj_freeway_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',4,'C2:C2185'); 
tj_freeway_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',4,'D2:D2185'); 
tj_freeway_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',4,'E2:E2185'); 
disp('������·��ָͨ���ȡ��ϣ�');

tj_outring_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',5,'C2:C2185'); 
tj_outring_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',5,'D2:D2185'); 
tj_outring_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������.xlsx',5,'E2:E2185'); 
disp('����⻷��ָͨ���ȡ��ϣ�');
rand_num = rand(1,61);
fix_num = ones(1,61);
indicator_cell = {stock,...
    cpi_tongbi,cpi_huanbi,...
    housebj_huanbi,housebj_tongbi,housesh_huanbi,housesh_tongbi,...
    usa_unemploy,...
    usa_cpi,...
    gasoline_93_price,gasoline_97_price,disel_price,...
    bj_city_vf,tj_city_vf,bj_city_vm,tj_city_vm,bj_city_conjestion_index,tj_city_conjestion_index,...
    tj_urban_vf,tj_urban_vm,tj_urban_conjestion_index,...
    tj_heping_vf,tj_heping_vm,tj_heping_conjestion_index,...
    tj_hebei_vf,tj_hebei_vm,tj_hebei_conjestion_index,...
    tj_hedong_vf,tj_hedong_vm,tj_hedong_conjestion_index,...
    tj_hexi_vf,tj_hexi_vm,tj_hexi_conjestion_index,...
    tj_hongqiao_vf,tj_hongqiao_vm,tj_hongqiao_conjestion_index,...
    tj_nankai_vf,tj_nankai_vm,tj_nankai_conjestion_index,...
    tj_freeway_vf,tj_freeway_vm,tj_freeway_conjestion_index,...
    tj_outring_vf,tj_outring_vm,tj_outring_conjestion_index,...
    rand_num,fix_num}'; %����=ָ����������,����=1,����=��ָ��vector����������
num_indicator = length(indicator_cell);
indicator_cell_diff = arrayfun(@(x)(diff(x{:})),indicator_cell,'UniformOutput',false);
%% ���ӶȺ�������
indicator_complexity = cell(9,1);  
%indicator_complexity��cell���飬����=9������=1��
%indicator_complexity{i,i}:����=ָ����=indicator_cell��Ԫ��������1=ָ�긴�Ӷ�
indicator_string = cell(9,1);
indicator_nsymbol = cell(9,1);
for i = 2:10
%�����ֵ��Сֵ�ֳɵ�������
[indicator_string{i-1,1},indicator_nsymbol{i-1,1}] = arrayfun(@(x)vector_to_string(x{:},i),indicator_cell_diff,'UniformOutput',false); 
%indicator_string{i-1,1}��cell���飺����=ָ����,��1=��ָ���ַ�����
%indicator_nsymbol{i-1,1}��cell���飺����=ָ����,��1=ָ����������
indicator_complexity{i-1,1} = arrayfun(@(x,y,z)cal_complexity(x{:},y{:},z),indicator_string{i-1,1},indicator_nsymbol{i-1,1},ones(num_indicator,1));
%indicator_complexity{i-1,1}:����=ָ����,��1=���Ӷ�
end
complexity = zeros(num_indicator,9); %����=ָ��������i=�ֳ�i+1�������ָ�긴�Ӷ�
for i = 1:9
    complexity(:,i) = indicator_complexity{i,1};
end

% complexity(:,end+1) = arrayfun(@(x)x{:},indicator_complexity,'UniformOutput',false); %Uniform ����д��ڷǱ���ֵʱӦ�� 'UniformOutput' ����Ϊ false��
% %�Ὣarrayfunһ����ִ�����Ϊ9��1��cell
