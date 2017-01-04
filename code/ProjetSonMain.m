%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% PROJET SIGNAL %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Question 1 

N = 896658; % nombre de points � g�n�rer
f0 = 880; % fr�quence du signal sinuso�dal
fe = 44100; % fr�quence d'�chantillonnage 
N_rep = 1000; %nombre de points pour la repr�sentation
N_v=0:N-1;

sinusoide=genererSignal(f0,fe,N,N_v);
analyseFrequentielle(sinusoide,fe,N,N_rep,N_v);

soundsc(sinusoide,fe+2000); % si fe plus grand, son plus aigu



%% 4 harmoniques
nombreHarmoniques = 4;
note = sonHarmoniques(N,f0,fe,nombreHarmoniques,N_v);
analyseFrequentielle(note,fe,N,f0,N_rep);
soundsc(note,fe);

%% juste le fondamental
note2 = sonHarmoniques(N,f0,fe,0,N_v);
analyseFrequentielle(note2,fe,N,f0,N_rep);
soundsc(note2,fe);

%% G�n�ration d'un morceau
liste_notes = {'C4', 'C4','C4','D4','E4','D4','C4','E4','D4','D4','C4','D4',...
    'D4','D4','D4','A3','B3','D4','C3','B3','A3','G3'} % accolade : cellule -> on peut mettre des �l�ments non homog�nes

%liste_notes = {'F4','G4','A4','F4','F4','G4','A4','F4','A4','B4','C4','A4',...
%   'B4','C4','C4','D4','C4','B4','A4','F4','C4','D4','B4','A4','F4','F4','C3','F4','F4','C3','F4'}



morceau=creerSonNotes(liste_notes,N,fe,nombreHarmoniques,N_v);

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









