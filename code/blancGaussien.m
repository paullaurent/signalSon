function [signal]= blancGaussien(signal,RSB,type,N,f0,fe,N_v)

Ps = sum(signal.^2);
if strcmp (type,'tonal')
    
xtonal = sin(2*pi*f0/fe*N_v);
Pb = sum(xtonal.^2);
a = sqrt((Ps/Pb)*10^(RSB/10));
signal = signal + a*xtonal ;

end

if strcmp(type, 'gaussien')
    xgaussien = randn(1,N);
    Pb = sum(xgaussien.^2);
    a = sqrt((Ps/Pb)*10^(RSB/10));
signal = signal + a*xgaussien;
end




end