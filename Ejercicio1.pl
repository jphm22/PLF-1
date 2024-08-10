%1.Traduzca a logica de primer orden el siguiente enunciado Todos hijo de mi padre es mi hermano. 
%V(X)(es_padre(X) ^ hijo_de(Y,X) ^ hijo_de(Z,X))->Hermano(Y,Z).

%HECHOS
es_padre(jouan).
hijo_de(pidro,jouan).
hijo_de(mearia,jouan).
%REGLAS
es_hemanos(X,Y) :- es_padre(Z),hijo_de(X,Z),hijo_de(Y,Z).

%2.Traduzca a logica de primer orden el siguiente enunciado Toda madre ama a sus hijos.
%V(X)^V(Y)(es_madre(X)^hijo_de(Y,X) --> ama_ha(X,Y))

%HECHOS
es_madre(jiulia).
hijo_dela(louis,jiulia).
%REGLAS 
ama_ha(jiulia,louis).
ama_ha(X,Y) :- es_madre(X), hijo_dela(Y,X).

%3.Traduzca a logica de primer orden el siguiente enunciado Todos los hombres son mortales.
%V(X)(es_hombre(X) --> es_mortal(X))

%4.Traduzca a logica de primer orden el siguiente enunciado Toda los amigos de Luis son amigos de Antonio, pero los amigos de pepe que no son enfermeros, no lo son.

%V(X)(amigo_de(X,Y) ^ (amigo_de(Y,Z) ^ (amigo_de(Z,W) ^ (amigo_de(W,A) ^ (es_enfermero(A) ^ (no_amigo_de(X,W) ^ (no_amigo_de(X,A))))))) --> (amigo_de(W,X) & (amigo_de(A,X)))).
%∀X (amigo_de(X, Luis) → amigo_de(X, Antonio)) ^ ∀Y ((amigo_de(Y, Pepe) ^ ¬es_enfermero(Y)) → ¬amigo_de(Y, X))

%5.Traduzca a logica de primer orden el siguiente enunciado Solo los amigos de Antonio, que son enfermeros, son amigos de los amigos de Pepe, que no son medicos.
%∀x (amigo_de(x, Antonio) ^ es_enfermero(x) → ( ∀y (amigo_de(y, Pepe) ^ ¬es_medico(y) → amigo_de(x, y) )))

%HECHOS
es_hombre(socrates).
%REGLAS
es_mortal(socrates).
es_mortal(X) :- es_hombre(X).

% Definición de hechos básicos sobre relaciones familiares
% Hechos sobre quién es el padre de quién
padre(juan, maria).
padre(juan, jose).
padre(pedro, marta).
padre(carlos, juan).

% Hechos sobre quién es la madre de quién
madre(marta, maria).
madre(marta, jose).
madre(luisa, marta).
madre(laura, juan).

% Regla para determinar si alguien es un hijo
% X es hijo de Y si Y es padre o madre de X
hijo(X, Y) :- padre(Y, X).
hijo(X, Y) :- madre(Y, X).

% Regla para determinar si alguien es hermano
% X es hermano de Y si ambos tienen el mismo padre y madre
hermano(X,Y) :- padre(P,X), padre(P,Y),madre(M,X), madre(M,Y),X \= Y.

% Regla para determinar si alguien es abuelo
% X es abuelo de Y si X es padre de Z y Z es padre o madre de Y
abuelo(X,Y) :- padre(X,Z),(padre(Z,Y); madre(Z,Y)).

% Regla para determinar si alguien es abuela
% X es abuela de Y si X es madre de Z y Z es padre o madre de Y
abuela(X,Y) :- madre(X,Z),(padre(Z,Y); madre(Z,Y)).

% Regla para determinar si alguien es nieto
% X es nieto de Y si Y es abuelo o abuela de X
nieto(X, Y) :- abuelo(Y, X).
nieto(X, Y) :- abuela(Y, X).

% Regla para determinar si alguien es primo
% X es primo de Y si los padres de X y Y son hermanos
primo(X, Y) :- padre(PX, X), padre(PY, Y), hermano(PX, PY), X \= Y.
primo(X, Y) :- madre(MX, X), madre(MY, Y), hermano(MX, MY), X \= Y.

% Regla para determinar si alguien es tía o tío
% X es tío o tía de Y si X es hermano de uno de los padres de Y
tio(X, Y) :- hermano(X, P), (padre(P, Y); madre(P, Y)).
tia(X, Y) :- hermano(X, P), (padre(P, Y); madre(P, Y)).

% Regla para determinar si alguien es sobrino o sobrina
% X es sobrino de Y si Y es tío o tía de X
sobrino(X, Y) :- tio(Y, X).
sobrino(X, Y) :- tia(Y, X).

% Consultas de ejemplo
% ¿Quién es el padre de maria?
% ?- padre(X, maria).
% ¿Quiénes son los hijos de juan?
% ?- hijo(X, juan).
% ¿Quiénes son los hermanos de jose?
% ?- hermano(X, jose).
% ¿Quién es el abuelo de sofia?
% ?- abuelo(X, sofia).
% ¿Quién es la abuela de carlos?
% ?- abuela(X, carlos).
% ¿Quién es el nieto de marta?
% ?- nieto(X, marta).

%EJERCICI
esta_en(atlanta,georgia).
esta_en(houston,texas).
esta_en(auston,texas).
esta_en(toronto,canada).

esta_en_usa(A) :- esta_en(A,georgia);esta_en(A,texas).
% si esta en usa entonces esta en georgio o texas

esta_en_na(A) :- esta_en_usa(A);esta_en(A,canada).
%si esta en norte america entonces esta en usa o canada

%Ejercicios de codigo
%Ejercicio 1: Determinate el factorial de un numero
% N factorial es F si N es mayor a 0 y N1 es N-1 Y N1 factorial es F1, F es N POR F1
factorial_es(0,1).
factorial_es(N,F) :- N>0,N1 is N-1,factorial_es(N1,F1), F is N*F1.

%Ejercicio 2:Lista tiene longitud L
tiene_longitud([],0).
tiene_longitud([_|Cola],L) :- tiene_longitud(Cola,L1), L is L1+1.

%Ejercicio 3:Suma de elemntos de la lista
tiene_suma([],0).
tiene_suma([Ca|Co],S) :- tiene_suma(Co,S1), S is Ca+S1.

%Ejercicio 4: Determinar el n-esimo número de Fibonacci
% Caso base:El primer y segundo número de Fibonacci son 0 y 1 respectivamente
fibonacci(0, 0).
fibonacci(1, 1).
% Caso recursivo:El n-ésimo número de Fibonacci es la suma de los dos anteriores
fibonacci(N, F) :- N > 1, N1 is N-1, N2 is N-2, fibonacci(N1, F1), fibonacci(N2, F2), F is F1+F2.

%Ejercicio 5:Unir dos listas.
unir([],L,L).
unir([X|L1],L2,[X|L3]) :- unir(L1,L2,L3).

%Ejercicio 6:Agregar un elemento al inicio de una lista
agregar(E,L,[E|L]).
agregar(E,[X|Y],[X|Z]) :- agregar(E,Y,Z).

%Ejercicio 7:Agregar un elemento al final de una lista
agregar_final([],X,[X|[]]).
agregar_final([H1|T1],X,[H1|T]):-agregar_final(T1,X,T).

%Ejercicio 8:Eliminar un elemento de una lista
elimina(E,[E|T],T).
elimina(E,[H|T],[H|T1]) :- elimina(E,T,T1).

%Ejercicio 9:Generar un lista de longitud N.
generar(0,[]).
generar(N,[N|L]) :- N1 is N-1, generar(N1,L).

%Ejercicio 10:Codigo para unir dos listas y el resultado este al reves.
unir_reversa(L1,L2,L3) :- reversa(L1,L4), concatenar(L4,L2,L3).

%Ejercicio 11:Invertir una lista.
invertir([],[]).
invertir([X|Y],Z) :- invertir(Y,Z1), concatenar(Z1,[X],Z). 

%Ejercicio 12:Hallar la combinatoria de dos numeros.
combinatoria(N,M,C) :- factorial(N,FN), factorial(M,FM), factorial(N-M,FMN), C is FN/(FM*FMN).

%Ejercicio 13:Verificar si un numero esta en una lista.
miembro(X,[X|_]).
miembros(X,[_|Y]) :- miembros(X,Y).

%Ejercicio 14:Hallar el valor del producto escalar de dos listas.
proyector2([],_,0).
proyector2([X|L1],[Y|L2],P) :- proyector2(L1,L2,P1), P is X*Y+P1.

%Ejercicio 15:Hallar la suma de los n primero numeros naturales.
suma(0,0).
suma(N,S) :- N1 is N-1, suma(N1,S1), S is N+S1.

%Ejercicio 16:Sumar uno a los elementos de una lista.
sumar_uno([],[]).
sumar_uno([X|Y],[X1|Y1]) :- X1 is X+1, sumar_uno(Y,Y1).

%Ejercicio 17:Dada una lista devolverme un lista solo con elementos positivos.
positivos([],[]).
positivos([X|L1],[X|L2]) :- X > 0, positivos(L1,L2).

%Ejercicio 18:Determinar si un numero es natural partiendo desde el 1.
natural(1).
natural(N) :- N > 0, N1 is N-1, natural(N1).

%Ejercicio 19:Determinar su un numero es primo.
primo(2).
primo(N) :- N > 0, N1 is N-1, N1 > 1, N mod N1 =\= 0, primo(N1).

%Traduzca a logica de primer orden el siguiente enunciado Toda los amigos de Luis son amigos de Antonio, pero los amigos de pepe que no son enfermeros, no lo son.

%V(X)(amigo_de(X,Y) ^ (amigo_de(Y,Z) ^ (amigo_de(Z,W) ^ (amigo_de(W,A) ^ (es_enfermero(A) ^ (no_amigo_de(X,W) ^ (no_amigo_de(X,A))))))) --> (amigo_de(W,X) & (amigo_de(A,X)))).

%∀X (amigo_de(X, Luis) → amigo_de(X, Antonio)) ^ ∀Y ((amigo_de(Y, Pepe) ^ ¬es_enfermero(Y)) → ¬amigo_de(Y, X))

%Traduzca a logica de primer orden el siguiente enunciado Solo los amigos de Antonio, que son enfermeros, son amigos de los amigos de Pepe, que no son medicos.

%∀x (amigo_de(x, Antonio) ^ es_enfermero(x) → ( ∀y (amigo_de(y, Pepe) ^ ¬es_medico(y) → amigo_de(x, y) )))








































