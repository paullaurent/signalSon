%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% PROJET SIGNAL %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Question 1 

N = 11025;
f0 = 880;
fe = 44100;
N_v = 0:N-1; % vecteur 
N_rep = 1000; %nombre d'�chantillon voulu 

%ma_fct(fe, N, f0, N_rep); 

%x = ma_fct(fe, N, f0, N_rep);

%soundsc(x,fe+2000); % si fe plus grand, son plus aigu



%% 4 harmoniques
nbh = 4;
%note = note_fct(N,f0,fe,nbh);
%ma_fct(note,fe,N,f0,N_rep);
soundsc(note,fe);

%% juste le fondamental
note2 = note_fct(N,f0,fe,0);
ma_fct(note2,fe,N,f0,N_rep);
soundsc(note2,fe);

%% G�n�ration d'un morceau
%liste_notes = {'C4', 'C4','C4','D4','E4','D4','C4','E4','D4','D4','C4','D4',...
%    'D4','D4','D4','A3','B3','D4','C3','B3','A3','G3'} % accolade : cellule -> on peut mettre des �l�ments non homog�nes

liste_notes = {'F4','G4','A4','F4','F4','G4','A4','F4','A4','B4','C4','A4',...
    'B4','C4','C4','D4','C4','B4','A4','F4','C4','D4','B4','A4','F4','F4','C3','F4','F4','C3','F4'}

[tab_note] = tab_note_fct();
taille_m = length(liste_notes);
morceau = [];
nb_h = 4;
for ii = 1:taille_m
    morceau=...
        [morceau, zeros(1, floor(N/2)),...
        eval(['note_fct(floor(N/2), tab_note.' liste_notes{ii} ',fe,nbh)'])]
end

soundsc(morceau,fe)

%% repr�sentation temporelle 
subplot 211;
plot(1:length(morceau), morceau);
xlabel('t(s)');
ylabel('amplitude');
%%spectrogramme
subplot 212;
N_fem=256;
Nfft=2^(nextpow2(N_fem));
spectrogram(morceau,rectwin(N_fem),N_fem/2,Nfft,44100,'yaxis');

%% Fading in 

%On cr�e la fen�tre de temps
%N_v = 0:40000;

% On cr�e la pente
N_rep = 10000;
N = 20000;
s = ma_fct(fe, N, f0, N_rep);% on cr�e notre signal sinusoidal
%N est la dur�e N_rep la fenetre de repr�sentation
x = linspace(0,1,N); % fading in (entre 0 et 1) donc 1-0>0
% x = linspace (1,0,N) % fanding out 

n_fen = length(x);


n_ech = 11000;

for i = 1: floor(n_fen/3)
    s(i) = s(i) * x(i); 
    
end 

for i = floor(n_fen/3) : n_fen
    s(i) = s(i)* x(floor(n_fen/3));
end

soundsc(s, 44100);

% repr�sentation grpahique
subplot 211;
plot(N_v,s);
subplot 212;
N_fem=256;
Nfft=2^(nextpow2(N_fem));
spectrogram(s,rectwin(N_fem),N_fem/2,Nfft,44100,'yaxis');

%% Ajout du bruit 

% eval pour mozart
SonBruit = blancGaussien(mozart,15,'tonal');
soundsc(SonBruit);











