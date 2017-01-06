function []=analyseFrequentielle(x,fe,N,N_rep,N_v) %r�alise l'analyse fr�quentielle et affiche le signal entre O et N_rep 
Nfft = 4096;
X = fft(x,Nfft);
%%Repr�sentations 

axe_f = -fe/2:fe/Nfft:fe/2-fe/Nfft; % on affiche l'analyse entre -fe/2 et fe/2 par p�riodicit� du calcul

figure;
subplot 211
plot(x)
xlabel('num�ro �chantillon');
ylabel('s(t)');
xlim([0 N_rep-1]);
subplot 212
plot(axe_f,fftshift(abs(X)));
title('fr�quence en Hz');
xlim([-fe/2 fe/2]);
figure;
plot(angle(x));
xlabel('echantillon');
ylabel('phase(rd)');
xlim([0 N_rep-1]);
end %r�alise l'analyse fr�quentielle d'un signal x