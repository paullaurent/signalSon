function [] = spectrogramme (signal,N_fem) %creer le spectrogramme et la représentation temporelle du signal donné
% %% représentation temporelle 
subplot 211;
plot(1:length(signal), signal);
xlabel('t(s)');
ylabel('amplitude');
%%spectrogramme
subplot 212;
N_fem=256;
Nfft=2^(nextpow2(N_fem));
spectrogram(signal,rectwin(N_fem),N_fem/2,Nfft,44100,'yaxis');
end
