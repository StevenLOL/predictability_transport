%%CPI,����,����,��֤,��ͨ·��ָ��

%% ���ݶ�ȡ
clc,clear,close all;
bj_city_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',1,'E486:E547'); 
tj_city_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',1,'E1032:E1093');
bj_city_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',1,'F486:F547'); 
tj_city_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',1,'F1032:F1093'); 
bj_city_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',1,'G486:G547'); 
tj_city_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',1,'G1032:G1093'); 
disp('���������н�ָͨ���ȡ��ϣ�');


tj_urban_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',2,'C486:C547'); 
tj_urban_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',2,'D486:D547'); 
tj_urban_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',2,'E486:E547'); 
disp('����������ָͨ���ȡ��ϣ�');

tj_heping_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',3,'F486:F547'); 
tj_heping_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',3,'G486:G547'); 
tj_heping_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',3,'H486:H547'); 
disp('����ƽ����ָͨ���ȡ��ϣ�');

tj_hebei_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',3,'F2670:F2731'); 
tj_hebei_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',3,'G2670:G2731'); 
tj_hebei_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',3,'H2670:H2731'); 
disp('���ӱ�����ָͨ���ȡ��ϣ�');

tj_hedong_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',3,'F1032:F1093'); 
tj_hedong_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',3,'G1032:G1093'); 
tj_hedong_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',3,'H1032:H1093'); 
disp('���Ӷ�����ָͨ���ȡ��ϣ�');

tj_hexi_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',3,'F1578:F1639'); 
tj_hexi_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',3,'G1578:G1639'); 
tj_hexi_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',3,'H1578:H1639'); 
disp('����������ָͨ���ȡ��ϣ�');

tj_hongqiao_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',3,'F3216:F3277'); 
tj_hongqiao_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',3,'G3216:G3277'); 
tj_hongqiao_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',3,'H3216:H3277'); 
disp('����������ָͨ���ȡ��ϣ�');

tj_nankai_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',3,'F2124:F2185'); 
tj_nankai_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',3,'G2124:G2185'); 
tj_nankai_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',3,'H2124:H2185'); 
disp('����Ͽ�����ָͨ���ȡ��ϣ�');

tj_freeway_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',4,'C486:C547'); 
tj_freeway_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',4,'D486:D547'); 
tj_freeway_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',4,'E486:E547'); 
disp('������·��ָͨ���ȡ��ϣ�');

tj_outring_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',5,'C486:C547'); 
tj_outring_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',5,'D486:D547'); 
tj_outring_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��6��.xlsx',5,'E486:E547'); 
disp('����⻷��ָͨ���ȡ��ϣ�');
rand_num = rand(1,61);
fix_num = ones(1,61);
indicator_cell = {
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
%% ���ӶȺ�������
%�����ֵ��Сֵ�ֳɵ�������
[indicator_string,indicator_nsymbol] = arrayfun(@(x)vector_to_string_transport(x{:},10),indicator_cell,'UniformOutput',false); 
%indicator_string��cell���飺����=ָ����,��1=��ָ���ַ�����
%indicator_nsymbol��cell���飺����=ָ����,��1=ָ����������
indicator_complexity = arrayfun(@(x,y,z)cal_complexity(x{:},y{:},z),indicator_string,indicator_nsymbol,ones(num_indicator,1));
%indicator_complexity:����=ָ����,��1=���Ӷ�















