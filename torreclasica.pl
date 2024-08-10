% hanoi(N, Desde, Hasta, Auxiliar) 
% Mueve N discos desde el poste 'Desde' hasta el poste 'Hasta' usando 'Auxiliar' como poste auxiliar.

% Caso base: si no hay discos que mover, no se hace nada.
hanoi(0, _, _, _) :- !.

% Mover N-1 discos desde 'Desde' hasta 'Auxiliar', usando 'Hasta' como auxiliar.
% Mover el disco N desde 'Desde' hasta 'Hasta'
% Mover los N-1 discos desde 'Auxiliar' hasta 'Hasta', usando 'Desde' como auxiliar.
hanoi(N, Desde, Hasta, Auxiliar) :- 
    N > 0, 
    M is N - 1, 
    hanoi(M, Desde, Auxiliar, Hasta),
    move(Desde, Hasta), 
    hanoi(M, Auxiliar, Hasta, Desde).

% move(Desde, Hasta) 
% Representa el movimiento de un disco desde el poste 'Desde' hasta el poste 'Hasta'.
move(Desde, Hasta) :- 
    format('Mueve el disco de ~w a ~w~n', [Desde, Hasta]).

