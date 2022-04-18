clear all; close all; clc;
% ??c và ti?n x? lí file âm thanh
[audio,Hz] = audioread('input.wav');
X = reshape(audio,[],822);
% Phan tich SVD
[U,S,V] = svd(X);
% V? ?? th? âm thanh g?c ban ??u
t = 0:1/Hz:(length(audio)-1)/Hz;
figure('name','Do thi cua am thanh goc ban dau');
plot(t,audio);
xlabel('Thoi gian (s)');
ylabel('Bien do tin hieu');
title('Do thi cua am thanh goc ban dau');
% Ch?y và nghe ?o?n âm thanh g?c
sound(audio,Hz);
pause(20);
% Quá trình kh? nhi?u
reduction_diagonal_line = diag(S);
reduction_diagonal_line(80:end) = 0;
len_S = length(reduction_diagonal_line);
reduction_S = S;
reduction_S(1:len_S,1:len_S) = diag(reduction_diagonal_line);
new_X = U*reduction_S*transpose(V);
new_audio = reshape(new_X,[],2);
new_audio = fillmissing(new_audio,'previous');
new_audio_=reshape(new_audio, [888582,1]);
figure('name','Do thi cua am thanh sau khi khu nhieu');
t = 0:1/Hz:(length(audio)-1)/Hz;
plot(t,new_audio_);
title('Do thi cua am thanh sau khi khu nhieu');
xlabel('Thoi gian (s)');
ylabel('Bien do tin hieu');
sound(new_audio_,Hz);




