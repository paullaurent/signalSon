function[morceau]=creerSonNotes(liste_notes,N,fe,nbh,N_v)
[tab_notes] = tableauNotes();
nombreNotes = length(liste_notes);
morceau = [];

for ii = 1:nombreNotes
    morceau=...
        [morceau, zeros(1, floor(N/2)),...
        eval(['sonHarmoniques(floor(N/2), tab_notes.' liste_notes{ii} ',fe,nbh,N_v)'])];
end

soundsc(morceau,fe)