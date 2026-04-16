clearAll
load "Constructing_Koszul_Filtrations.m2"



--Example 1. 
S=QQ[x_1..x_6, MonomialOrder=>Lex]
I=ideal(x_1*x_4-x_2*x_3, x_2*x_5-x_3*x_4, x_3*x_6-x_4*x_5, x_2*x_6-x_4^2, x_1*x_6-x_3*x_4, x_1*x_5-x_3^2)
--I is a prime ideal
isPrime I
--and has a quadratic Gröbner basis wrt Lex
unique degrees ideal leadTerm I

R=S/I
--monomial Koszul filtration?
L=gens R
LF=partialLinearFiltration(R,L) 
KF=partialKoszulFiltration(R,LF)
last KF
---Yes!


--Toric examples
--Example 2. Pinched Veronese
S=QQ[x,y,z]
M=flatten entries basis(3,S)
M=delete(x*y*z,M)
n=length M
T=QQ[w_1..w_n]
F=map(S,T,M);
I=trim ker F
R=T/I

--monomial Koszul filtration?
L=gens R
LF=partialLinearFiltration(R,L) 
KF=partialKoszulFiltration(R,LF)
last KF
--No!

-----------

--Example 3. Base ring of a transversal polymatroid
S=QQ[x_1..x_4, MonomialOrder=>Lex]
X_1={x_1,x_2}
X_2={x_1,x_3}
X_3={x_2,x_3,x_4}
M=sort(trim (ideal(X_1)*ideal(X_2)*ideal(X_3)))_*
n=length M
T=QQ[w_1..w_n, MonomialOrder=>Lex]
I=trim  ker map(S,T,M)
unique degrees ideal leadTerm I
R=T/I

--monomial Koszul filtration?
LF=partialLinearFiltration(R,gens R);
KF=partialKoszulFiltration(R,LF);
last KF
--yes!




--Example 4. Has monomial Koszul filtration.
--Can we find a Gröbner basis?
 
T=ZZ/101[w_1..w_9]
I=ideal(w_6*w_7-w_1*w_9,w_5*w_7-w_6*w_8,w_4*w_7-w_2*w_8,w_2*w_6-w_3*w_9,w_2*w_5-w_4*w_6,w_1*w_4-w_3*w_8,w_1*w_2-w_3*w_7)
isPrime(I)
ideal leadTerm I
R=T/I
--a monomial Koszul filtration:
use R
KF={{promote(ideal(),R)},
    {ideal(w_1)},
    {ideal(w_1,w_3),ideal(w_1,w_7)},
    {ideal(w_1,w_3,w_6),ideal(w_1,w_7,w_8),ideal(w_1,w_2,w_3)},
    {ideal(w_1,w_2,w_3,w_6),ideal(w_1,w_2,w_3,w_7)},
    {ideal(w_1,w_2,w_3,w_4,w_6),ideal(w_1,w_2,w_3,w_4,w_7),ideal(w_1,w_2,w_3,w_6,w_7)},
    {ideal(w_1,w_2,w_3,w_4,w_6,w_7),ideal(w_1,w_2,w_3,w_4,w_7,w_8)},
    {ideal(w_1,w_2,w_3,w_4,w_6,w_7,w_8)},
    {ideal(w_1..w_8)},
    {ideal(w_1..w_9)}}
netList KF

netList partialKoszulFiltration(R,KF)
