%punto 1
ocurrencias(_,[],0). 
ocurrencias(Elemento,[Cabeza|Cola],N) :- Elemento \== Cabeza, ocurrencias(Elemento,Cola,Aux), N is Aux.
ocurrencias(Cabeza,[Cabeza|Cola],N) :- ocurrencias(Cabeza, Cola, Aux), N is Aux + 1.

%punto 2.1
cantidad([],0). 
cantidad([_|Cola],Total) :- cantidad(Cola, Aux), Total is Aux + 1.

%punto 2.2
quitar(_,[],[]). 
quitar(Elemento, [Cabeza|Cola], [Cabeza|Res]) :- Elemento \== Cabeza, quitar(Elemento, Cola, Res).
quitar(Cabeza, [Cabeza|Cola], Res) :- quitar(Cabeza, Cola, Res).

%punto 3
podar([],_,[]):-!.
podar([Cabeza|Cola], Ncant, [Cabeza|LRes]):- ocurrencias(Cabeza, [Cabeza|Cola], No), Indice is No/Ncant, Indice < 0.25, podar(Cola, Ncant, LRes).
podar([Cabeza|Cola], Ncant, LRes):-ocurrencias(Cabeza, [Cabeza|Cola], No), Indice is No/Ncant, Indice >= 0.25, quitar(Cabeza,[Cabeza|Cola],Res), podar(Res, Ncant, LRes).

podado(Lista, Resp):-
    cantidad(Lista, Ncant),
    podar(Lista, Ncant, Resp).

-?podar([ok,tv, radio, tv, play, tv, tv, radio],8,Resp).