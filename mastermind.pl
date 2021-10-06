color("red").
color("green").
color("blue").

code([]).
code([H]) :- color(H).
code([H | T]) :- code(H), code(T).