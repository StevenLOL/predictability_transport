function [string] = vector_to_string_transport(vector)
%���룺vector��������n��Ҫת��Ϊ���ַ�����symbol��
%�����string�����صľ���n��symbol���ַ���������=vector���ȣ�n=Ҫת��Ϊ���ַ�����symbol��
m1 = 55; %��Ԫ�� = �������ֵ
m2 = 10;  %��Ԫ�� = ������Сֵ
bin_length = (m1-m2)/9;  %���䳤��
string = arrayfun(@(x)char(ceil((x-m2)/bin_length)+65),vector); %��ÿ��vector��Ԫ��ת��Ϊ1~n��symbol�ַ���������=ԭ�ַ���
string(string <= 'A') = 'A';
string(string >= 'J') = 'J'; 
end
