% Doit renvoyer deux solutions de taille 8 (toutes les espèces sauf trichoderma et trichosporonaceae) et 9 (toutes les espèces sauf aspergillus)

% Declare EC

ec("3.2.1.91").
ec("3.2.1.4").
ec("3.1.1.73").
ec("3.2.1.150").
ec("4.2.2.10").
ec("3.2.1.67").
ec("3.2.1.15").
ec("3.2.1.8").
ec("3.2.1.37").
ec("1.1.1.67").
ec("3.2.1.23").
ec("3.2.1.89").
ec("3.2.1.181").
ec("3.2.1.164").
ec("3.1.1.1").
ec("3.5.1.4").
ec("3.5.5.1").
ec("4.1.1.105").
ec("4.1.1.28").
ec("2.6.1.1").
ec("2.6.1.27").
ec("4.2.99.21").
ec("5.4.4.2").
ec("2.3.1.16").
ec("1.3.1.42").
ec("1.3.3.6").

% Declare Models

species(alternaria).
species(aspergillaceae).
species(aspergillus).
species(bionectriaceae).
species(botrytis).
species(chaetomiaceae).
species(cordycipitaceae).
species(debaryomycetaceae).
species(didymellaceae).
species(didymosphaeriaceae).
species(fusarium).
species(fusariumoxysporum).
species(linnemannia).
species(mortierella).
species(mortierellaceae).
species(mucor).
species(mucoraceae).
species(mycosphaerellaceae).
species(nectriaceae).
species(penicillium).
species(plectosphaerellaceae).
species(pleosporaceae).
species(polyporaceae).
species(pseudeurotiaceae).
species(pseudogymnoascus).
species(talaromyces).
species(trichoderma).
species(trichosporonaceae).

% Declare Annotations

annotation(alternaria,"3.2.1.91",1).
annotation(alternaria,"3.2.1.4",1).
annotation(aspergillus,"3.1.1.73",1).
annotation(aspergillus,"3.2.1.150",1).
annotation(botrytis,"4.2.2.10",1).
annotation(botrytis,"3.2.1.67",1).
annotation(botrytis,"3.2.1.15",1).
annotation(debaryomycetaceae,"3.2.1.8",1).
annotation(debaryomycetaceae,"3.2.1.37",1).
annotation(debaryomycetaceae,"1.1.1.67",1).
annotation(fusarium,"3.2.1.23",1).
annotation(fusarium,"3.2.1.89",1).
annotation(fusarium,"3.2.1.181",1).
annotation(fusarium,"3.2.1.164",1).
annotation(mortierellaceae,"3.1.1.1",1).
annotation(mortierellaceae,"3.5.1.4",1).
annotation(mortierellaceae,"3.5.5.1",1).
annotation(mortierellaceae,"4.1.1.105",1).
annotation(mortierellaceae,"4.1.1.28",1).
annotation(mortierellaceae,"2.6.1.1",1).
annotation(mortierellaceae,"2.6.1.27",1).
annotation(pleosporaceae,"4.2.99.21",1).
annotation(pleosporaceae,"5.4.4.2",1).
annotation(pseudeurotiaceae,"2.3.1.16",1).
annotation(pseudeurotiaceae,"1.3.1.42",1).
annotation(pseudeurotiaceae,"1.3.3.6",1).
annotation(trichoderma,"3.2.1.91",1).
annotation(trichosporonaceae,"3.2.1.4",1).

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

cellulaseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.91",_).    % remplacer _ par N et mettre N>2
cellulaseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.4",_).

hemicellulaseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"3.1.1.73", _).
hemicellulaseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.150", _).

pectinaseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"4.2.2.10",_).
pectinaseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.67",_).    % alternative avec la rule3
pectinaseRule3(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.15",_).    % alternative avec la rule2

xylanaseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.8",_).
xylanaseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.37",_).    % alternative avec la rule3
xylanaseRule3(M) :- selectedSpecies(M), species(M) , annotation(M,"1.1.1.67",_).    % alternative avec la rule2

galactanaseRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.23",_).
galactanaseRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.89",_).    % alternative avec les rule3 et rule4
galactanaseRule3(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.181",_).   % alternative avec les rule2 et rule4
galactanaseRule4(M) :- selectedSpecies(M), species(M) , annotation(M,"3.2.1.164",_).   % alternative avec les rule2 et rule3

auxineRule1(M) :- selectedSpecies(M), species(M) , annotation(M,"3.1.1.1",_).
auxineRule2(M) :- selectedSpecies(M), species(M) , annotation(M,"3.5.1.4",_).
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

% Les "et"
% --------

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

% Les "ou"
% --------

:- 0{pectinaseRule2(Tata):selectedSpecies(Tata); pectinaseRule3(Toto):selectedSpecies(Toto)}0.    % il est faux d'avoir aucune selectedSpecies avec la pectinaseRule2 ou la pectinaseRule3

:- 0{xylanaseRule2(Tata):selectedSpecies(Tata); xylanaseRule3(Toto):selectedSpecies(Toto)}0.    % etc

:- 0{galactanaseRule2(Tata):selectedSpecies(Tata); galactanaseRule3(Toto):selectedSpecies(Toto) ; galactanaseRule4(Tutu):selectedSpecies(Tutu)}0.

% On veut minimiser le nombre de selectedSpecies sélectionnées
% ============================================================

#minimize { 1,M : selectedSpecies(M) }.

% Affichage
% =========

#show selectedSpecies/1.

% --opt-mode=optN