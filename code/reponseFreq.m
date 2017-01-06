function [] = reponseFreq(g,M,tau,fe,mozart)

k0 = tau*fe;
b = [1 zeros(1,floor(k0-1)) (g/M)*ones(1,M)];
a = 1;
n=10000;

subplot 211
freqz(b,a,n);
subplot 212
zplane(b,a);

music=filter(b,a,mozart);
soundsc(music,44100);
end 