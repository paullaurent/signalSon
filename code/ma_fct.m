function [] = ma_fct(x,fe, N, f0, N_rep)

N_v = 0:N-1;
%x = sin(2*pi*f0/fe*N_v);
Nfft = 4096;
X = fft(x,Nfft);

%%Repr�sentations

axe_f = -fe/2:fe/Nfft:fe/2-fe/Nfft;

figure;
subplot 211
plot(N_v,x)
xlabel('num�ro �chantillon');
ylabel('s(t)');
xlim([0 N_rep-1]);
subplot 212
plot(axe_f,fftshift(abs(X)));
title('fr�quence en Hz');
xlim([-fe/2 fe/2]);
end 