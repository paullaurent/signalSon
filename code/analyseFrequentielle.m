function []=analyseFrequentielle(x,fe,N,N_rep,N_v) %réalise l'analyse fréquentielle et affiche le signal entre O et N_rep 
Nfft = 4096;
X = fft(x,Nfft);
%%Représentations 

axe_f = -fe/2:fe/Nfft:fe/2-fe/Nfft; % on affiche l'analyse entre -fe/2 et fe/2 par périodicité du calcul

figure;
subplot 211
plot(x)
xlabel('numéro échantillon');
ylabel('s(t)');
xlim([0 N_rep-1]);
subplot 212
plot(axe_f,fftshift(abs(X)));
title('fréquence en Hz');
xlim([-fe/2 fe/2]);
figure;
plot(angle(x));
xlabel('echantillon');
ylabel('phase(rd)');
xlim([0 N_rep-1]);
end %réalise l'analyse fréquentielle d'un signal x