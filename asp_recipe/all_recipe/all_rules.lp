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

% La règle (à gauche) est vraie si il existe (à droite) une espèce M qui est une selectedSpecies, species, avec une annotation de l'EC

% EC
% --

cellulaseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.91", N), N>1.    % remplacer _ par N et mettre N>2
cellulaseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.4", N), N>3.

hemicellulaseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"3.1.1.73", N), N>2.
hemicellulaseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.150", _).

pectinaseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"4.2.2.10",_).
pectinaseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.67", N), N>1.    % alternative avec la rule3
pectinaseRule3(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.15",_).    % alternative avec la rule2

xylanaseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.8", N), N>2.
xylanaseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.37",_).    % alternative avec la rule3
xylanaseRule3(M) :- selectedSpecies(M), species(M) , annotation(M,"1.1.1.67",_).    % alternative avec la rule2

galactanaseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.23",_).
galactanaseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.89",_).    % alternative avec les rule3 et rule4
galactanaseRule3(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.181",_).   % alternative avec les rule2 et rule4
galactanaseRule4(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.164",_).   % alternative avec les rule2 et rule3

auxineRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"3.1.1.1",_).
auxineRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.5.1.4", N), N>6.
auxineRule3(M) :- selectedSpecies(M), species(M) , annotation(M,"3.5.5.1",_).
auxineRule4(M) :- selectedSpecies(M), species(M) , annotation(M,"4.1.1.105",_).
auxineRule5(M) :- selectedSpecies(M), species(M) , annotation(M,"4.1.1.28",_).
auxineRule6(M) :- selectedSpecies(M), species(M) , annotation(M,"2.6.1.1",_).
auxineRule7(M) :- selectedSpecies(M), species(M) , annotation(M,"2.6.1.27",_).

acidesalicyliqueRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"4.2.99.21",_).
acidesalicyliqueRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"5.4.4.2",_).

acidejasmoniqueRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"2.3.1.16",_).
acidejasmoniqueRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"1.3.1.42",_).
acidejasmoniqueRule3(M) :- selectedSpecies(M), species(M) , annotation(M,"1.3.3.6",_).

% Pathways
% --------

celluloseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-6784", N), N>1.
celluloseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-6788", N), N>2.

celluloseXylanRule(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-6717", N), N>1.

pectinRule(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-7248", N), N>2.

galactanRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-6807", N), N>5.

auxineRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-581", N), N>3.
auxineRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-3161", _).
auxineRule3(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-5025", _).
auxineRule4(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-5026", N), N=1.
auxineRule5(M) :- selectedSpecies(M), species(M) , annotation(M,"TRPIAACAT-PWY", _).

acidesalicyliqueRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-6406", N), N>1. % une seule species, Aspergillus
acidesalicyliqueRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-8321", _).      % Trois espèces

acidejasmoniqueRule(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-735", N), N>2.    % Deux speciess, Polyporaceae et Talaromyces

% Les "et"
% ========

% EC
% --

:- 0{cellulaseRule1(M):selectedSpecies(M)}0.    % il est faux d'avoir aucune selected species avec la cellulaseRule1.
:- 0{cellulaseRule2(M):selectedSpecies(M)}0.    % il est faux d'avoir aucune selected species avec la cellulaseRule2.

:- 0{hemicellulaseRule1(M):selectedSpecies(M)}0.    % etc
:- 0{hemicellulaseRule2(M):selectedSpecies(M)}0.

:- 0{pectinaseRule1(M):selectedSpecies(M)}0.

:- 0{xylanaseRule1(M):selectedSpecies(M)}0.

:- 0{galactanaseRule1(M):selectedSpecies(M)}0.

:- 0{auxineRule1(M):selectedSpecies(M)}0.
:- 0{auxineRule2(M):selectedSpecies(M)}0.
:- 0{auxineRule3(M):selectedSpecies(M)}0.
:- 0{auxineRule4(M):selectedSpecies(M)}0.
:- 0{auxineRule5(M):selectedSpecies(M)}0.
:- 0{auxineRule6(M):selectedSpecies(M)}0.
:- 0{auxineRule7(M):selectedSpecies(M)}0.

:- 0{acidesalicyliqueRule1(M):selectedSpecies(M)}0.
:- 0{acidesalicyliqueRule2(M):selectedSpecies(M)}0.

:- 0{acidejasmoniqueRule1(M):selectedSpecies(M)}0.
:- 0{acidejasmoniqueRule2(M):selectedSpecies(M)}0.
:- 0{acidejasmoniqueRule3(M):selectedSpecies(M)}0.

% Pathways
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
% ========

% EC
% --

:- 0{pectinaseRule2(Tata):selectedSpecies(Tata); pectinaseRule3(Toto):selectedSpecies(Toto)}0.    % il est faux d'avoir aucune selectedSpecies avec la pectinaseRule2 ou la pectinaseRule3

:- 0{xylanaseRule2(Tata):selectedSpecies(Tata); xylanaseRule3(Toto):selectedSpecies(Toto)}0.    % etc

:- 0{galactanaseRule2(Tata):selectedSpecies(Tata); galactanaseRule3(Toto):selectedSpecies(Toto) ; galactanaseRule4(Tutu):selectedSpecies(Tutu)}0.

% Pathways
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