
% Hechos
es_padre(rolando, mario).
es_padre(rolando, jose).
es_padre(jose, carlos).
es_padre(jose, sara).
es_padre(jorge, mirtha).
es_padre(jorge, herna).
es_padre(carlos, julio).
es_padre(carlos, rosario).

es_madre(jesica, maria).
es_madre(jesica, jose).
es_madre(maria, jorge).
es_madre(maria, belen).
es_madre(belen, felix).
es_madre(belen, ana).
es_madre(sara, raul).
es_madre(sara, karina).

mujer(maria).
mujer(jesica).
mujer(sara).
mujer(mirtha).
mujer(rosario).
mujer(belen).
mujer(ana).
mujer(karina).

hombre(rolando).
hombre(mario).
hombre(jose).
hombre(carlos).
hombre(jorge).
hombre(herna).
hombre(julio).
hombre(felix).
hombre(raul).

% Regla para encontrar nietas
es_nieta(X, Y) :-(es_padre(Y, Z); es_madre(Y, Z)),(es_padre(Z, X); es_madre(Z, X)),mujer(X).

% Regla para encontrar bisnietas
es_bisnieta(X, Y) :-(es_padre(Y, Z1); es_madre(Y, Z1)),(es_padre(Z1, Z2); es_madre(Z1, Z2)),(es_padre(Z2, X); es_madre(Z2, X)),mujer(X).

% Regla para encontrar ancestros
es_ancestro(X, Y) :-(es_padre(X, Y); es_madre(X, Y)).
es_ancestro(X, Y) :-(es_padre(X, Z); es_madre(X, Z)),es_ancestro(Z, Y).

% Regla para encontrar hermanos
es_hermano(X, Y) :-(es_padre(Z, X); es_madre(Z, X)),(es_padre(Z, Y); es_madre(Z, Y)),X \= Y.

% Regla para encontrar primas
es_prima(X, Y) :-(es_padre(Z, X); es_madre(Z, X)),(es_padre(W, Y); es_madre(W, Y)),es_hermano(Z, W),mujer(X).

% Regla para encontrar tíos
es_tio(X, Y) :-(es_padre(Z, Y); es_madre(Z, Y)),es_hermano(Z, X),hombre(X).

% Regla para encontrar sobrinas
es_sobrina(X, Y) :-(es_padre(Z, X); es_madre(Z, X)),es_hermano(Z, Y),mujer(X).


