%����n�ַ����㷨
clc,clear;
%����1
% [codice, code_bin, code_book] = lempel_ziv('abc', 'abcbabcbabbbbcccaaacbc');
[codice, code_bin, code_book] = lempel_ziv('01', '1011010100010');
comlexity1 = length(unique(codice));

%����2 ���ԣ���ע���������ֵ��2bit��n_bitӦ���ĵ���Interpretation of the Lempel-Ziv Complexity Measure in the Context of Biomedical Signal Analysis
comlexity2 = cal_complexity('1011010100010',0);

%����3 ���ԣ���ע���������ֵ��2bit��n_bitӦ���ĵ������μ�Interpretation of the Lempel-Ziv Complexity Measure in the Context of Biomedical Signal Analysis
[knorm,k]=calc_lz_k('1011010100010');
comlexity3 = k;   

a = {'china','beijing';'shanghai','tianjin'};
b = a(1,1);  %bΪ1��1��cell_array
c = a{1,1};  %cΪ�ַ�����'china'
d = a{:};  %�������ص�һ����cell������
e = a(:);  %�ų�һ�У����Ͳ���


a = speedinterp(fuchengmenwaidajie_we{2,1});
vector = daycells2vector(fuchengmenwaidajie_we);

string = vector_to_string_transport([12 50 60 45 35]);

x = 1:10;
y = zeros(10,2);
y(1:10,2) = arrayfun(@(m)add(m),x);
y(:,2) = arrayfun(@(m)add(m),x);

x = 1:10;
y = zeros(10,1);
y = arrayfun(@(m)add(m),x);  %��ʱy�ᱻ���ǳ�1��10

para_equation = @(x,c)(x-3+c);
c=1;
myfun = @(x) para_equation(x,1);
y = fzero(@(x) para_equation(x,1),0.5)

clc,clear;

predict_upperbound('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
	uppredict = fzero( @(x)lz_para_equation(x,0.7),0.5)


string = 'qwoifjlkbnfdhfugvujcnlamfruihbvvm,.a;flqefuajuisdfbcmjvnxc,.sv,.mdasogfijdsg';
string = 'aaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaa';
	n = length(string);	%��Ԫ��=�ַ���
	N = length(unique(string));	%symbol��
	lz_entropy = zeros(n,1);
	%up:����=�ַ�������1=��Ӧ���ַ���֮ǰ�ַ��������ص�����
	for i=1:n
		lz_entropy(i,1) = lempel_ziv_entropy(string(1:i));
	end
	lz_entropy_mean = mean(lz_entropy);

	%��N��lz_entropy��������,�������̲��� @(δ֪��������)(����) ����ʽ
	lz_para_equation = @(x,c)(-(x*log(x)/log(2)+(1-x)*log(1-x)/log(2))+(1-x)*log(N-1)/log(2)-c);
	uppredict = fzero( @(x)lz_para_equation(x,lz_entropy_mean),0.5)

string = 'asdhfjoquewhfkljdasfkldasfhdjbkjdsbncvkljvbuiqoweyruivbamsdfdasfdasfnmdascvnalsdfjyh';
string = 'asdzxccdsasssdccccccxxxxzzssaasasdasddsazxccxzzxcdsaazzasxdccdcdxxsaazzassasdcxzxceda'
string = 'ababababababababcbcabbcabcabbababcabcabcbcabcbacbabcbbcbcababcbabcabcbacbcbabcbacbabc'
string = 'abcabcabcabbabcabcabcacaabcabcabccaaabcabcabcbcaabcabcabcabcccaacabcabcabcabcbabcabcab'
predict_upperbound(string)
predict_lowerbound(string)
s=dlmread('g:\transport_research\��Ԥ����\�ߵ�ȫ������\north4th_ring_ew_avgspeed.csv',',');



