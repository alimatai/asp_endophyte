% Definition des selectedSpecies
% ==============================

% Il existe des selected species entre 1 et le nombre maximal d'espèces = une solution satisfiable est constituee d'un sous-ensemble de modèles

1{ selectedSpecies(M) : species(M) }.

% Regles
% ======

% La règle (à gauche) est vraie si il existe (à droite) une espèce M qui est une selectedSpecies, species, avec une annotation de l'EC

% EC
% --

cellulaseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.91", N), N>1.
cellulaseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.4", N), N>3.

hemicellulaseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"3.1.1.73", N), N>2.
hemicellulaseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.150", _).

pectinaseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"4.2.2.10",_).
pectinaseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.67", N), N>1. % alternative avec la rule3
pectinaseRule3(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.15",_). % alternative avec la rule2

xylanaseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.8", N), N>2.
xylanaseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.37",_). % alternative avec la rule3
xylanaseRule3(M) :- selectedSpecies(M), species(M) , annotation(M,"1.1.1.67",_). % alternative avec la rule2

galactanaseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.23",_).
galactanaseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.89",_). % alternative avec les rule3 et rule4
galactanaseRule3(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.181",_). % alternative avec les rule2 et rule4
galactanaseRule4(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.164",_). % alternative avec les rule2 et rule3

auxineRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"3.1.1.1",_).
auxineRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.5.1.4", N), N>6.
auxineRule3(M) :- selectedSpecies(M), species(M) , annotation(M,"3.5.5.1",_).
auxineRule4(M) :- selectedSpecies(M), species(M) , annotation(M,"4.1.1.105",_).
auxineRule5(M) :- selectedSpecies(M), species(M) , annotation(M,"4.1.1.28",_).
auxineRule6(M) :- selectedSpecies(M), species(M) , annotation(M,"2.6.1.1",_).
auxineRule7(M) :- selectedSpecies(M), species(M) , annotation(M,"2.6.1.27",_).

acidesalicyliqueRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"4.2.99.21",_). % une seule species, Aspergillus
acidesalicyliqueRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"5.4.4.2",_). % Trois species

acidejasmoniqueRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"2.3.1.16",_).
acidejasmoniqueRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"1.3.1.42",_).
acidejasmoniqueRule3(M) :- selectedSpecies(M), species(M) , annotation(M,"1.3.3.6",_).

% Pathways
% --------

celluloseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-6784", N), N>1.
celluloseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-6788", N), N>2.

celluloseXylanRule(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-6717", N), N>1.

pectinRule(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-7248", N), N>2.

galactanRule(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-6807", N), N>5.

auxinePRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-581", N), N>3.
auxinePRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-3161", _).
auxinePRule3(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-5025", _).
auxinePRule4(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-5026", N), N=1.
auxinePRule5(M) :- selectedSpecies(M), species(M) , annotation(M,"TRPIAACAT-PWY", _).

acidesalicyliquePRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-6406", N), N>1. % une seule species, Aspergillus
acidesalicyliquePRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-8321", _). % Trois species
acidejasmoniquePRule(M) :- selectedSpecies(M), species(M) , annotation(M,"PWY-735", N), N>2.

% Les "et"
% ========

% EC
% --

:- 0{cellulaseRule1(M):selectedSpecies(M)}0. % il est faux d'avoir aucune selected species avec la cellulaseRule1.
:- 0{cellulaseRule2(M):selectedSpecies(M)}0.

:- 0{hemicellulaseRule1(M):selectedSpecies(M)}0.
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

:- 0{celluloseRule1(M):selectedSpecies(M)}0. % il est faux d'avoir aucune selected species avec la celluloseRule1.
:- 0{celluloseRule2(M):selectedSpecies(M)}0. 

:- 0{celluloseXylanRule(M):selectedSpecies(M)}0.

:- 0{pectinRule(M):selectedSpecies(M)}0.

:- 0{galactanRule(M):selectedSpecies(M)}0.

:- 0{auxinePRule1(M):selectedSpecies(M)}0.
:- 0{auxinePRule4(M):selectedSpecies(M)}0.

:- 0{acidesalicyliquePRule1(M):selectedSpecies(M)}0.
:- 0{acidesalicyliquePRule2(M):selectedSpecies(M)}0.

:- 0{acidejasmoniquePRule(M):selectedSpecies(M)}0.

% Les "ou"
% ========

% EC
% --

:- 0{pectinaseRule2(Tata):selectedSpecies(Tata); pectinaseRule3(Toto):selectedSpecies(Toto)}0. % il est faux d'avoir aucune selectedSpecies avec la pectinaseRule2 ou la pectinaseRule3

:- 0{xylanaseRule2(Tata):selectedSpecies(Tata); xylanaseRule3(Toto):selectedSpecies(Toto)}0.

:- 0{galactanaseRule2(Tata):selectedSpecies(Tata); galactanaseRule3(Toto):selectedSpecies(Toto) ; galactanaseRule4(Tutu):selectedSpecies(Tutu)}0.

% Pathways
% --------

% il est faux d'avoir aucune selectedSpecies avec la auxineRule2 ou la auxineRule3 ou la auxineRule5
:- 0{auxinePRule2(Tata):selectedSpecies(Tata); auxinePRule3(Toto):selectedSpecies(Toto); auxinePRule5(Toto):selectedSpecies(Tutu)}0.

% On veut minimiser le nombre de selectedSpecies sélectionnées
% ============================================================

#minimize { 1,M : selectedSpecies(M) }. 

% Affichage
% =========

#show selectedSpecies/1.

% #show cellulaseRule1/1.
% #show cellulaseRule2/1.
% #show hemicellulaseRule1/1.
% #show hemicellulaseRule2/1.
% #show pectinaseRule1/1.
% #show pectinaseRule2/1.
% #show pectinaseRule3/1.
% #show xylanaseRule1/1.
% #show xylanaseRule2/1.
% #show xylanaseRule3/1.
% #show galactanaseRule1/1.
% #show galactanaseRule2/1.
% #show galactanaseRule3/1.
% #show galactanaseRule4/1.
% #show auxineRule1/1.
% #show auxineRule2/1.
% #show auxineRule3/1.
% #show auxineRule4/1.
% #show auxineRule5/1.
% #show auxineRule6/1.
% #show auxineRule7/1.
% #show acidesalicyliqueRule1/1.
% #show acidesalicyliqueRule2/1.
% #show acidejasmoniqueRule1/1.
% #show acidejasmoniqueRule2/1.
% #show acidejasmoniqueRule3

% #show celluloseRule1/1.
% #show celluloseRule2/1.
% #show celluloseXylanRule/1.
% #show pectinRule/1.
% #show galactanRule/1.
% #show auxinePRule1/1.
% #show auxinePRule2/1.
% #show auxinePRule3/1.
% #show auxinePRule4/1.
% #show auxinePRule5/1.
% #show acidesalicyliquePRule1/1.
% #show acidesalicyliquePRule2/1.
% #show acidejasmoniquePRule/1.

% ( --opt-mode=optN --enum-mode=brave )