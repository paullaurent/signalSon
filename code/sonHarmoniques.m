function [note] = sonHarmoniques(N,f0,fe,nbh,N_v) % creer un signal auquel on ajoute un certain nombre d'harmoniques depuis un tableau donn�

note = genererSignal(f0,fe,N,N_v);

amp_h = [1, 0.7, 0.95, 0.75, 0.6, 0.65, 0.65, 0.5,...  %tableau des amplitudes 
    0.6, 0.5, 0.45, 0.5, 0.6, 0.5, 0.25, 0.5, 0.3, 0.25, 0.3, 0.4, 0.4, 0.3, 0.25, 0.2, 0.15];

for ii = 1:nbh
    note = note + amp_h(ii)*sin(2*pi*(ii+1)*f0/fe*N_v);% on ajoute l'harmonique modul�e de l'amplitude voulue
end

end 