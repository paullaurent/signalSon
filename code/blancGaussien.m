function [signal]= blancGaussien(signal,RSB,type)

Ps = sum(signal^2);

if strcmp (type,'tonal')
xtonal = sin(2*pi*f0/fe*N_v);

Pb = sum(xtonal^2);
end

a = sqrt((Ps/Pb)*10^(RSB/10));
signal = signal + a*xtonal;


end