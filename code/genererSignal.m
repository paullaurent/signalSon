function [x]= genererSignal (f0,fe,N,N_v) %g�n�re N points d'un signal sinuso�dal de fr�quence f0, �chantillonn� � la fr�quence f0
x = sin(2*pi*f0/fe*N_v);
end