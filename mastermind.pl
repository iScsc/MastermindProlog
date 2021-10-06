color("red").
color("green").
color("blue").

/*
comb: list of colors
code: list of n colors

code inclu dans comb
*/

mylength([],0).
mylength([_| Q], N) :- mylength(Q,M), N is M+1.

/*
comb check if [H | T] is  combination of color
don't check the length
can't be used to suggest a code because it will suggest: [] [red] [red red] [red red red] ...
*/
comb([]).
comb([H | T]) :- color(H), comb(T).

code(N,C) :- length(C,N), comb(C).

equal([],[]).
equal([Ha | Ta], [Ha | Tb]) :- equal(Ta,Tb).

check(Comb,Sol) :- comb(Comb), comb(Sol), equal(Comb,Sol).

/*
X to count the nb of attempt
Sol the secret comb to find
Comb the attempt
*/
mastermind(Comb,Sol) :- comb(Sol), length(Sol,N), code(N,Comb), equal(Sol,Comb).
