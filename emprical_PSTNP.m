function [F]=emprical_PSTNP()
clc
clear
pos_1=importdata('mouse_positive.txt');
%pos_2=importdata('rice_x_positive.txt');
%[hp_3 pos_3]=fastaread('Positive_D1769.txt');
%[hp_4 pos_4]=fastaread('Positive_E388.txt');
%[hp_5 pos_5]=fastaread('Positive_Gpick569.txt');
% [hp_6 pos_6]=fastaread('Positive_Gsub905.txt');

neg_1=importdata('mouse_negative.txt');
%neg_2=importdata('rice_x_negative.txt');
%[hn_3 neg_3]=fastaread('Negative_D1769.txt');
%[hn_4 neg_4]=fastaread('Negative_E388.txt');
%[hn_5 neg_5]=fastaread('Negative_Gpick569.txt');
% [hn_6 neg_6]=fastaread('Negative_Gsub906.txt');
%hp=[hp_1,hp_2];
%hn=[hn_1,hn_2];
positive=[pos_1];
negative=[neg_1];
Np=length(positive);
Nn=length(negative);

for i=1:Np
    Str=positive{1,i};
    Str=char(Str);
    positive{1,i}=Str;
end
for i=1:Nn
    Str=negative{1,i};
    Str=char(Str);
    negative{1,i}=Str;
end
AA='ACGT';
M=length(positive{1,1});
F1=zeros(4^3,M-2);%记录positive dataset中每个氨基酸在每个位置出现的频率
F2=zeros(4^3,M-2);%记录negative dataset中每个氨基酸在每个位置出现的频率
for m=1:Np
    for j=1:M-2
        t1=positive{1,m}(j);
        k1=strfind(AA,t1);
        t2=positive{1,m}(j+1);
        k2=strfind(AA,t2);
        t3=positive{1,m}(j+2);
        k3=strfind(AA,t3);
        %a=strcat(t1,t2);
        F1(16*(k1-1)+4*(k2-1)+k3,j)=F1(16*(k1-1)+4*(k2-1)+k3,j)+1;
    end
end
F1=F1/Np;
for m=1:Nn
    for j=1:M-2
        t1=negative{1,m}(j);
        k1=strfind(AA,t1);
        t2=negative{1,m}(j+1);
        k2=strfind(AA,t2);
        t3=negative{1,m}(j+2);
        k3=strfind(AA,t3);
        %a=strcat(t1,t2);
        F2(16*(k1-1)+4*(k2-1)+k3,j)=F2(16*(k1-1)+4*(k2-1)+k3,j)+1;
    end
end
F2=F2/Nn;
F=F1-F2;