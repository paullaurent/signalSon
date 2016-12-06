function s = ChargerAudio (filename1,filename2,fe,n_ech)


structf = load(filename1);

names = fieldnames (structf); 
%eval([instruction complète stockée dans une chaine de carac])
eval(['sig1=structf.' names{2} ';']); %on récupère la variable sig1 

structf = load(filename2);
names = fieldnames (structf); 
eval(['sig2=structf.' names{2} ';']); 


% graphiques

%représentation temporelle 
subplot 211;
plot(1:length(structf), structf);
xlabel('t(s)');
ylabel('amplitude');

%spectrogramme
subplot 212;
N_fem=256;
Nfft=2^(nextpow2(N_fem));
spectrogram(filename1,rectwin(N_fem),N_fem/2,Nfft,44100,'yaxis');

%% Ajout d'une composante 

n2 = length(sig2);
s =  sig1;
for j = 1: n2
    s(n_ech+j-1) = s(n_ech+j-1) + sig2(j); %on rajoute l'échantillon m2(j) a s(n_ech)
    
end 
soundsc(s,44100);
end 



