function vector = daycells2vector(dayscell)
%���룺dayscell������=����������=1��dayscell{i}:����=100m����Ŀ������=288������=ʱ�յ�Ԫ���ƽ���ٶ�
%�����vector������=������288����1=��Ӧʱ�̵�·ƽ���ٶ�
days = length(dayscell);
dayMeanSpeed = zeros(days,288);
for i = 1:days
   dayMeanSpeed(i,:) = mean( dayscell{i},1 );  %dayMeanSpeed��cellarray������=����������=1��dayMeanSpeed{i}:����=1������=288������=��·��Ӧ�и�5min��ƽ���ٶ�   
end
   dayMeanSpeed = dayMeanSpeed';
   vector = dayMeanSpeed(:);
end
