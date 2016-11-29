function [] = transformeeDeFourier(f0,fe,N,N_echantillons)
n=0:N-1;
y=sin(2*pi*f0*n/fe);
soundsc(y,fe);
%représentation du signal
figure,
subplot 211
plot (n,y),
xlabel('numéro échantillon'),
ylabel('amplitude');
xlim([0 N_echantillons-1]);

%représentation fréquence
N_fft=4096;
Y=fft(y,N_fft);
axe_f=-fe/2:fe/N_fft:fe/2-fe/N_fft;

subplot 212
plot(axe_f,fftshift(abs(Y)));
xlim([-fe/2 fe/2]);
end

