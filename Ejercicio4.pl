%Ejercicio 1:Dada un lista, ordenar del elemento mayor al menor en una lista.
ordenar(Lista, ListaOrdenada) :-
    insertion_sort(Lista, ListaOrdenada).

% Caso base: una lista vacía ya está ordenada.
insertion_sort([], []).

% Inserta el primer elemento en la lista ordenada.
insertion_sort([Cabeza | Resto], ListaOrdenada) :-
    insertion_sort(Resto, ListaOrdenadaParcial),
    insertar(Cabeza, ListaOrdenadaParcial, ListaOrdenada).

% Predicado para insertar un elemento en la lista ordenada de mayor a menor.
insertar(X, [], [X]).
insertar(X, [Y | Resto], [X, Y | Resto]) :- X >= Y.
insertar(X, [Y | Resto], [Y | ListaConX]) :- X < Y, insertar(X, Resto, ListaConX).

%Ejercicio 2:Hallar el maximo de una lista
maximo([X], X).
maximo([X, Y | Resto], Max) :- X > Y, maximo([X | Resto], Max).
maximo([X, Y | Resto], Max) :- X =< Y, maximo([Y | Resto], Max).

%Ejercicio 3: Hallar el minimo de una lista
minimo([X], X).
minimo([X, Y | Resto], Min) :- X < Y, minimo([X | Resto], Min).
minimo([X, Y | Resto], Min) :- X >= Y, minimo([Y | Resto], Min).

%Ejercicio 4: El producto de una lista con su inverso
invertir(Lista, ListaInvertida) :-
    invertir_aux(Lista, [], ListaInvertida).

invertir_aux([], Acumulador, Acumulador).
invertir_aux([Cabeza|Cola], Acumulador, ListaInvertida) :-
    invertir_aux(Cola, [Cabeza|Acumulador], ListaInvertida).

producto_listas([], [], []).
producto_listas([X|Xs], [Y|Ys], [Z|Zs]) :-
    Z is X * Y,
    producto_listas(Xs, Ys, Zs).

producto_con_inversa(Lista, Producto) :-
    invertir(Lista, ListaInvertida),
    producto_listas(Lista, ListaInvertida, Producto).

%Ejercicio 5:Dado un numero natural “n” hallar todos los números primos entre 1 y “n”
% Verifica si un número es primo
es_primo(2).
es_primo(3).
es_primo(N) :-
    N > 3,
    N mod 2 =\= 0,
    \+ tiene_divisor(N, 3).

% Verifica si un número tiene algún divisor
tiene_divisor(N, D) :-
    N mod D =:= 0.   
tiene_divisor(N, D) :-
    D * D < N,
    D2 is D + 2,
    tiene_divisor(N, D2).

% Genera una lista de números en el rango M a N
lista_rango(M, N, [M|R]) :-
    M =< N,
    M1 is M + 1,
    lista_rango(M1, N, R).
lista_rango(M, N, []) :-
    M > N.

% Encuentra todos los números primos hasta N
primos_hasta(N, Primos) :-
    lista_rango(2, N, Lista),  % Genera la lista de números desde 2 hasta N
    include(es_primo, Lista, Primos).

%Ejercicio 6: Verifica si una lista está ordenada en orden decreciente
ordenada_desc([]).
ordenada_desc([_]).
ordenada_desc([X, Y | Resto]) :-
    X >= Y,
    ordenada_desc([Y | Resto]).

%Ejercicio 7: Verifica si una lista está ordenada en orden creciente
ordenada([]).
ordenada([_]).
ordenada([X, Y | Resto]) :-
    X =< Y,
    ordenada([Y | Resto]).

%Ejercicio 8: Dada una lista, obtener una nueva lista con los elementos de la primera repetidos tres veces.
% Triplica un elemento
triplica_elemento(Elem, [Elem, Elem, Elem]).

triplica_lista([], []).  
triplica_lista([H|T], Result) :- triplica_elemento(H, Triplicado), triplica_lista(T, RestoTriplicado),append(Triplicado, RestoTriplicado, Result).  

%Ejercicio 9: Dada una lista determinar si un determinado elemento pertenece a la lista.
pertenece(E, [E|_]).
pertenece(E, [_|T]) :- pertenece(E, T).

%Ejercicio 10: Dada dos lista, indicar si la primera es prefijo dela segunda.
prefijo([], _).
prefijo([X|Y], [X|Z]) :- prefijo(Y, Z).

%Ejercicio 11: Dada dos lista, indicar si la primera es sufijo de la segunda.
sufijo([], _).
sufijo([X|Y], [X|Z]) :- sufijo(Y, Z).
sufijo(X, [_|Y]) :- sufijo(X, Y).




























