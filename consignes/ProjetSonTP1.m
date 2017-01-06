%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% PROJET SIGNAL %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Question 1 

N = 11025;
f0 = 880;
fe = 44100;
N_v = 0:N-1; % vecteur 

x = sin(2*pi*f0*N_v/fe);

N_rep = 1000; %nombre d'échantillon voulu 

figure;
plot(N_v,x)
xlabel('numéro échantillon');
ylabel('s(t)');
xlim([0 N_rep-1]);

Nfft=1024;
X = fft(x, Nfft);
figure; 
plot(0:Nfft-1,abs(X)); 
title('en fonction du numéro d''echantillon');

axe_f = -fe/2:fe/Nfft:fe/2-fe/Nfft;
figure
plot(axe_f,fftshift(abs(X)));
title('fréquence en Hz');

xlim([-fe/2 fe/2]);
