% Pour ajouter une composante 

function [s] = ajoutComp(sig1,sig2,n_ech)
n2 = length(sig2);
s =  sig1;
for j = 1: n2
    s(n_ech+j-1) = s(n_ech+j-1) + sig2(j); %on rajoute l'échantillon m2(j) a s(n_ech)
    
end
end