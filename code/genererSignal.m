function [x]= genererSignal (f0,fe,N,N_v) %génère N points d'un signal sinusoïdal de fréquence f0, échantillonné à la fréquence f0
x = sin(2*pi*f0/fe*N_v);
end