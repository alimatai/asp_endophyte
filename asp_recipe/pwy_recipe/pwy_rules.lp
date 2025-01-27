% Definition des selectedSpecies
% ==============================

% Il existe des selected species entre 1 et le nombre maximal d'espèces = une solution satisfiable est constituee d'un sous-ensemble de modèles
1{ selectedSpecies(M) : species(M) }.

% Commentaires :

% En fait ça fait ça et ça "pioche" dedans:
% 1{ selectedSpecies(alternaria); selectedSpecies(aspergillaceae); selectedSpecies(aspergillus)  }3.

% Autres exemples :
% 0{ selectedSpecies(M) : species(M) }3. % Entre 0 et 3
% 1{ selectedSpecies(M) : species(M) }1. % Une seule espèce
% K{ selectedSpecies(M) : species(M) }M.

% Regles
% ======

% La règle (à gauche) est vraie si il existe (à droite) une espèce M qui est une selectedSpecies, species, avec une annotation du pathway

celluloseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-6784",_).    % remplacer _ par N et mettre N>2
celluloseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-6788",_).

celluloseXylanRule(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-6717", _).

pectinRule(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-7248",_).

galactanRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-6807",_).

auxineRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-581",_).
auxineRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-3161",_).
auxineRule3(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-5025",_).
auxineRule4(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-5026",_).
auxineRule5(M) :- selectedSpecies(M), species(M) , annotation(M,"TRPIAACAT-PWY",_).

acidesalicyliqueRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-6406",_).
acidesalicyliqueRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-8321",_).

acidejasmoniqueRule(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-735",_).

% Les "et"
% --------

:- 0{celluloseRule1(M):selectedSpecies(M)}0.    % il est faux d'avoir aucune selected species avec la celluloseRule1.
:- 0{celluloseRule2(M):selectedSpecies(M)}0.    % il est faux d'avoir aucune selected species avec la celluloseRule2.

:- 0{celluloseXylanRule(M):selectedSpecies(M)}0.    % etc

:- 0{pectinRule(M):selectedSpecies(M)}0.

:- 0{galactanRule1(M):selectedSpecies(M)}0.

:- 0{auxineRule1(M):selectedSpecies(M)}0.
:- 0{auxineRule4(M):selectedSpecies(M)}0.

:- 0{acidesalicyliqueRule1(M):selectedSpecies(M)}0.
:- 0{acidesalicyliqueRule2(M):selectedSpecies(M)}0.

:- 0{acidejasmoniqueRule(M):selectedSpecies(M)}0.

% Les "ou"
% --------

 % il est faux d'avoir aucune selectedSpecies avec la auxineRule2 ou la auxineRule3 ou la auxineRule5
:- 0{auxineRule2(Tata):selectedSpecies(Tata); auxineRule3(Toto):selectedSpecies(Toto); auxineRule5(Toto):selectedSpecies(Tutu)}0. 

% On veut minimiser le nombre de selectedSpecies sélectionnées
% ============================================================

#minimize { 1,M : selectedSpecies(M) }.

% Affichage
% =========

#show selectedSpecies/1.

% --op-mode=optN