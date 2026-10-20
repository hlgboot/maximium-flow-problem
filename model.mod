# Problema da fluxo maximo
# Aluno: Matheus Henriques Leonel Gonçalves - Matrícula: 2025018783
# Aluno: Pedro Costa Vianna - Matrícula: 202519062

param n, >= 0;
set V, default {1..n};
# Conjunto de vetices

set E within (V cross V);
# Conjunto de arcos (i, j), tal que i ∈ V e j ∈ V ;

param c{(i,j) in E}, > 0;
#  Capacidade de fluxo do arco (i, j) ∈ E.

var u{(i,j) in E};
# Quantidade de fluxo que passa no arco (i, j) ∈ E.

var f >= 0;
# Fluxo total de s a t

maximize fluxo: f;

s.t. r1{i in V}:
    sum{(i,j) in E} u[i, j] - sum {(k,i) in E} u[k, i] = 
    if i = 1 then f 
    else if i = n then -f 
    else 0;

s.t. r2{(i,j) in E}: u[i,j] <= c[i,j];

solve;

printf{1..56} "="; printf "\n";
printf "O fluxo máximo do nó %s para o nó %s é %g\n\n", 1, n, f;
printf "Mó de Inicio   Nó Final   Capacidade do arco   Fluxo no arco\n";
printf "-------------   -----------   ------------   -----------\n";
printf{(i,j) in E: u[i,j] != 0}: "%13s   %11s   %12g   %11g\n", i, j,
   c[i,j], u[i,j];
printf{1..56} "="; printf "\n";

end;