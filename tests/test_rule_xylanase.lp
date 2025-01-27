% Tester chaque règle en ajoutant ou supprimant des annotations

% EC
% ==

ec("3.2.1.8").
ec("3.2.1.37").
ec("1.1.1.67").

% Modeles
% =======

species(alternaria).
species(aspergillaceae).
species(aspergillus).

% Annotations
% ===========

annotation(alternaria, "3.2.1.8", 2).
annotation(alternaria, "3.2.1.37", 2).
annotation(aspergillaceae, "1.1.1.67", 2).
annotation(aspergillus, "1.1.1.67", 2).

% Definition des selectedSpecies
% ==============================

% Il existe des selected species entre 1 et le nombre maximal d'espèces = une solution satisfiable est constituee d'un sous-ensemble de modèles
1{ selectedSpecies(M) : species(M) }.

% Regles
% ======

% La règle (à gauche) est vraie si il existe (à droite) une espèce M qui est une selectedSpecies, species, avec une annotation de l'EC

xylanaseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.8",_).
xylanaseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.37",_).    % alternative avec la rule3
xylanaseRule3(M) :- selectedSpecies(M), species(M) , annotation(M,"1.1.1.67",_).    % alternative avec la rule2

% Les "et"
% --------

:- 0{xylanaseRule1(M):selectedSpecies(M)}0.

% Les "ou"
% --------

:- 0{xylanaseRule2(Tata):selectedSpecies(Tata); xylanaseRule3(Toto):selectedSpecies(Toto)}0.    % etc

% Affichage
% =========

#show xylanaseRule1/1.
#show xylanaseRule2/1.
#show xylanaseRule3/1.
