%ejercicio3
es_padre(rolando,mario).
es_padre(rolando,jose).
es_padre(jose,carlos).
es_padre(jose,sara).
es_padre(jorge,mirtha).
es_padre(jorge,herna).
es_padre(carlos,julio).
es_padre(carlos,rosario).

es_madre(jesica,maria).
es_madre(jesica,jose).
es_madre(maria,jorge).
es_madre(maria,belen).
es_madre(belen,felix).
es_madre(belen,ana).
es_madre(sara,raul).
es_madre(sara,karina).

%Hacer reglas para responder lo siguiente
%Con los siguientes hechos determinar ¿Quien es nieta de maria?
s_nieta(X, Y) :-
    (es_padre(Y, Z); es_madre(Y, Z)),
    (es_padre(Z, X); es_madre(Z, X)),
    mujer(X). % Asegurarse de que X es mujer.
%Con los siguientes hechos determinar ¿Quien es bisnieta de jesica?
es_bisnieta(X, Y) :-
    (es_padre(Y, Z1); es_madre(Y, Z1)),
    (es_padre(Z1, Z2); es_madre(Z1, Z2)),
    (es_padre(Z2, X); es_madre(Z2, X)),
    mujer(X).
%Con los siguientes hechos determinar ¿Quien es ancestro de julio?
es_ancestro(X, Y) :-
    (es_padre(X, Y); es_madre(X, Y)).
es_ancestro(X, Y) :-
    (es_padre(X, Z); es_madre(X, Z)),
    es_ancestro(Z, Y).
%Con los siguientes hechos determinar ¿Quien es prima de mirtha?
es_prima(X, Y) :-
    (es_padre(Z, X); es_madre(Z, X)),
    (es_padre(W, Y); es_madre(W, Y)),
    es_hermano(Z, W),
    mujer(X). % Asegurarse de que X es mujer.

% Definir la relación de hermanos
es_hermano(X, Y) :-
    (es_padre(Z, X); es_madre(Z, X)),
    (es_padre(Z, Y); es_madre(Z, Y)),
    X \= Y.
%Con los siguientes hechos determinar ¿Quien es tio de felix?
es_tio(X, Y) :-
    (es_padre(Z, Y); es_madre(Z, Y)),
    es_hermano(Z, X),
    hombre(X). % Asegurarse de que X es hombre.
%Con los siguientes hechos determinar ¿Quien es sobrina de carlos?














