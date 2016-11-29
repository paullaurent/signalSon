function [] = transformeeDeFourier(f0,fe,N,N_echantillons)
n=0:N-1;
y=sin(2*pi*f0*n/fe);
soundsc(y,fe);
%repr�sentation du signal
figure,
subplot 211
plot (n,y),
xlabel('num�ro �chantillon'),
ylabel('amplitude');
xlim([0 N_echantillons-1]);

%repr�sentation fr�quence
N_fft=4096;
Y=fft(y,N_fft);
axe_f=-fe/2:fe/N_fft:fe/2-fe/N_fft;

subplot 212
plot(axe_f,fftshift(abs(Y)));
xlim([-fe/2 fe/2]);
end

