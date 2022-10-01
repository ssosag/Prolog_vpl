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
    
% punto 4 el enunciado:  
% HECHOS (No Borrar)
link(fuyuki, konoha, chocobo, 16300).
link(fuyuki,hinazawa,nube_voladora,7000).
link(fuyuki,berlin,nube_voladora,12000).
link(fuyuki,pendragon,mecha,90800).
link(konoha,egoland,mecha,8560).
link(konoha,kiev,nube_voladora,8500).
link(konoha,pendragon,mecha,90800).
link(hinazawa,minas_tirith,nube_voladora,8000).
link(minas_tirith,egoland,camello,2000).
link(minas_tirith,pendragon,mecha,90800).
link(egoland,pendragon,mecha,90800).
link(kiev,pendragon,mecha,90800).
link(berlin,pendragon,mecha,90800).

enrutar(A,B,M,Pp,P,T):- ...

%%Se le pide implementar otra regla para contar lo elementos de una lista pero para una lista 3x3x3(regla size),
%Tambien se le pide sumar los elemtos de una lista 3x3x3(regla iterate)
%Para al final utilizar las funciones creadas en el vpl para calular el promedio de los elementos de la lista 3x3x3:

iterate([[H1|T1]|T],Ac,R) :- ...

size([[H1|T1]|T],Ac,R) :- ...


promedio(X,R):-iterate(X,0,A), size(X,0,B),R is A/B.

% A continunacion implemente la regla del punto 5
frac1(N,X,R):- ...


%añadir aca la funcion para resolver el sudoku
%HECHOS
num(1). num(2). num(3). num(4).
%REGLAS
unicos(P,Q,R,S) :- num(P), num(Q), num(R), num(S),
\+ P=Q, \+ P=R, \+ P=S, \+ Q=R, \+ Q=S, \+ R=S.

sudoku(R11, R12, R13, R14, 
       R21, R22, R23, R24, 
       R31, R32, R33, R34, 
       R41, R42, R43, R44) :- ....