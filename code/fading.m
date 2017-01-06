function [] = fading (f0,fe,N,N_v,croissance)%creer un fading in et fading out du morceau 
N_v = 0:40000;
%On cr�e la fen�tre de temps

% On cr�e la pente
N_rep = 10000;
N = 20000;
s = genererSignal(f0,fe,N,N_v);% on cr�e notre signal sinusoidal
%N est la dur�e N_rep la fenetre de repr�sentation

% x = linspace (1,0,N) % fanding out 




n_ech = 11000;
if (strcmp(croissance,'in'))
    x = linspace(0,1,N); % creer N points entre 0 et 1 donc N points d'une droite
    n_fen = length(x);
    
    for i = 1: floor(n_fen)
        s(i) = s(i) * x(i); 
    end 

    for i = floor(n_fen) : n_fen
        s(i) = s(i)* x(floor(n_fen));
    end
    
end

if (strcmp(croissance,'out'))
    x = linspace(1,0,N); % fading in (entre 0 et 1) donc 1-0>0
    n_fen = length(x);
     
    for i = 1: floor(n_fen)
        s(i) = s(i) * x(i); 
    end 

    for i = floor(n_fen) : length(s)
        s(i) = s(i)* x(floor(n_fen));
    end
end
soundsc(s, 44100);

% repr�sentation grpahique
subplot 211;
plot(N_v,s);
subplot 212;
N_fem=256;
Nfft=2^(nextpow2(N_fem));
spectrogram(s,rectwin(N_fem),N_fem/2,Nfft,44100,'yaxis');
end