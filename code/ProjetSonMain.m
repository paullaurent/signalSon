%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% PROJET SIGNAL %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Question 1 

N = 11025; % nombre de points � g�n�rer
f0 = 880; % fr�quence du signal sinuso�dal
fe = 44100; % fr�quence d'�chantillonnage 
N_rep = 200; %nombre de points pour la repr�sentation
N_v=0:N-1;

sinusoide=genererSignal(f0,fe,N_v);
analyseFrequentielle(sinusoide,fe,N,N_rep,N_v);

soundsc(sinusoide,fe+2000); % si fe plus grand, son plus aigu



%% 4 harmoniques
nombreHarmoniques = 4;
note = sonHarmoniques(N,f0,fe,nombreHarmoniques,N_v);
analyseFrequentielle(note,fe,f0,N_rep);
soundsc(note,fe);

%% juste le fondamental
note2 = sonHarmoniques(N,f0,fe,0,N_v);
analyseFrequentielle(note2,fe,N,f0,N_rep);
soundsc(note2,fe);

%% G�n�ration d'un morceau
<<<<<<< HEAD
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

plot (1:341744,morceau)


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
=======
liste_notes = {'C4', 'C4','C4','D4','E4','D4','C4','E4','D4','D4','C4','D4',...
    'D4','D4','D4','A3','B3','D4','C3','B3','A3','G3'} % accolade : cellule -> on peut mettre des �l�ments non homog�nes

%liste_notes = {'F4','G4','A4','F4','F4','G4','A4','F4','A4','B4','C4','A4',...
%   'B4','C4','C4','D4','C4','B4','A4','F4','C4','D4','B4','A4','F4','F4','C3','F4','F4','C3','F4'}



morceau=creerSonNotes(liste_notes,N,fe,nombreHarmoniques,N_v);
N_fem=256;
spectrogramme(morceau,N_fem);

%% Fading in 
croissance='out';
fading(f0,fe,N,N_v,croissance);%creer un fading in ou fiding out suivant la valeur de croissance (ici in ou out)
%fading out � corriger 

%% Ajout du bruit 

% eval pour mozart


SonBruit = blancGaussien(mozart,15,'gaussien',N,f0,fe,N_v);
soundsc(SonBruit);


%% Etape 4 

reponseFreq(0.6,1,4);

%% filter

>>>>>>> 19e765b7b71ee47e4232e5ec0dbb98ae5f9a9773









