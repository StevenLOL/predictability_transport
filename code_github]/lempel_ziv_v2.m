function [codice, code_bin, code_book] = lempel_ziv(alfabeto, stringa)

% Test with str='bcababbcabcbcbbccaabbababb' e alf=['a' 'b' 'c']

alf=alfabeto;   % It's the alphabet that contains the char used in the string
%��Ҫ�õĻ����ַ�������['a' 'b' 'c'],����'abcdef'��
%����=1������=�����ַ���������=�����ַ�
str=stringa;    % It's the string to codify
%Ҫ������ַ���
code_book=cell(length(alf),1);      % Initializes the code-book
%�����ֵ��ʼ��
%code_book��cell���飺����=�����ַ������˴���ʼ�ģ�����1=�ַ���
for i=1:1:length(alf)               % Inserts in code-book the firsts elements
    code_book{i}=alf(i);
    %code_book��cell���飺����=�ֵ��ַ���������ʼΪ�����ַ����ַ�������1=�ַ���
end

k=str(1);   % It's the first word to codify
%�ַ������������Ƿ�����ֵ䣩������=1������=��ȷ��
codice=[];  % Initializes the variable used to save the decimal code
n = 1;
% index=1;
while n<=length(str)   
    trovato=0; %�������ַ������ֵ����ܷ��ҵ��ı�־
    for i=1:length(code_book)
        if(length(k)==length(code_book{i}))  % Checks if the word to codify is already contained in the code-book
            %up�����������ַ����������ֵ�ĳ��¼���ַ����������
            if(strcmp(k,code_book{i})==1)
                %up:���������ַ������ֵ�ĳ��¼���ַ�����ȫһ��
                 %z=i;    % It's the decimal code of the word to codify
                trovato=1; break;
            end
        end
    end
    n = n+1;
    if trovato==0   % If the word isn't contained in the code-book, updates the code-book
        %����Ҳ����������ַ���
        code_book{length(code_book)+1}=k; 
        %����=�ֵ��ַ���������1=�ַ���
        codice(end+1)=codice(end)+1;
        %����=ĿǰΪֹ�ֵ��зǻ����ַ�����Ŀ����1=�ֵ����ֱ��     % Update the decimal code of the known word %��Ԫ��=�ֵ��¼��ַ�����'ab'�����ֱ��
        k=k(end);     % Takes the unknown part of the word
        %�����Ӻ�ȡ���һ���ַ�
    end
    if trovato==1  % Else updates the decimal code, increments the index and checks the string's end      
%         index=index+1; 
%         %��Ԫ��=��ǰ����������Ƿ����ֵ��У����ַ������ַ���+1����һ�εĵ���������������λ�ã�
%         if index>length(str)    
%             % If string terminates, it codifies the last word 
%             %����ַ�������
%             for i=1:length(code_book)
%                 if(length(k)==length(code_book{i}))
%                     if(strcmp(k,code_book{i})==1)
%                         z=i;
%                     end
%                 end
%             end
%             codice(end+1)=z;
%             break;
%         end
        k=[k str(n)];   % Takes a new word
        %����=1������=��ǰ����õ��ַ����ַ���+1
    end
end
code_bin=dec2bin(codice);   % Codifies with binary code the result