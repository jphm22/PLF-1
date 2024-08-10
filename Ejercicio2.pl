%Ejercicio:Invertir una lista.
agregar_final([],X,[X|[]]).
agregar_final([H1|T1],X,[H1|T]):-agregar_final(T1,X,T).

de_reversa([],_).
de_reversa([H1|T1],L):- agregar_final(M,H1,L),de_reversa(T1,M).

%Ejercicio:Función para eliminar los dos últimos elementos de una lista
eliminar_dos([_,_],[]).  
eliminar_dos([X],[X]).   
eliminar_dos([X,Y],[]).  
eliminar_dos([X|Resto], [X|Resultado]) :- eliminar_dos(Resto,Resultado).

agregar(E,L,[E|L]).
agregar(E,[X|Y],[X|Z]) :- agregar(E,Y,Z).

agregar_final([],X,[X|[]]).
agregar_final([H1|T1],X,[H1|T]):-agregar_final(T1,X,T).

de_reversa([],_).
de_reversa([H1|T1],L):- agregar_final(M,H1,L),de_reversa(T1,M).

ultimo(X,[X]).
ultimo(X,[_|T]):-ultimo(X,T).

permutacion([],[]).
permutacion([X|Y],Z):- permutacion(Y,L),agregar(X,L,Z).

primero([H|_],H).
ordenada([]).
ordenada([_]).
ordenada([H|T]):- primero(T,X),(H @< X),ordenada(T).






