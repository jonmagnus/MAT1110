---
author:
- Jon-Magnus Rosenblad
title: "MAT1110: Obligatorisk oppgave 2"
...

# Oppgave 1
###  a)
Om vi lar $x'$, $y'$ og $z'$ være antall biler i henholdsvis A, B og C etter en dag, dvs. om vi setter

$$
\begin{bmatrix}
x'\\y'\\z'
\end{bmatrix}
=A\begin{bmatrix}x\\y\\z\end{bmatrix}
$$

ser vi at når vi ganger ut får vi

$$
\begin{aligned}
x' &= .4x + .3y + .3z\\
y' &= .3x + .5y + .2z\\
z' &= .3x + .2y + .5z
\end{aligned}
$$

altså beholder A 40% av bilene, B får 30% av hva A hadde og C får 30% av hva A hadde, og tilsvarende for de andre byene, akkurat slik oppgaven beskrev.

### b)
Om vi først antar at $\lambda=1$ er en egenvektor løser vi likningen $(A - \lambda I)\textbf{v}=0$ for å finne den korresponderende egenvektoren $\textbf{v}$. Ved litt manipulasjoner ser vi

$$
\begin{aligned}
\begin{bmatrix}
.4 - 1	& .3	& .3 \\
.3	& .5 - 1	& .2 \\
.3	& .2 	& .5 - 1
\end{bmatrix}&\sim
\begin{bmatrix}
-6 & 3 & 3\\
3 & -5 & 2\\
3 & 2 & -5
\end{bmatrix}\\
&\sim
\begin{bmatrix}
2 & -1 & -1\\
3 & -5 & 2\\
0 & 7 & -7\\
\end{bmatrix}\\
&\sim
\begin{bmatrix}
2 & 0 & -2\\
0 & -5 & 5\\
0 & 1 & -1\\
\end{bmatrix}\\
&\sim
\begin{bmatrix}
1 & 0 & -1\\
0 & 1 & -1\\
0 & 0 & 0\\
\end{bmatrix}
\end{aligned}
$$

Vi får altså at vektoren $\textbf{v}=(x,y,z)$ må oppfylle likningene $x-z=0$ og $y-z=0$, så $x=y=z$ og $\textbf{v}=(1,1,1)$. Får å vise at $\lambda=1$ faktisk er en egenverdi med korresponderende vektor $\textbf{v}$ må vi sjekke om likningen $A\textbf{v}=\lambda \textbf{v}$ er oppfylt:

$$\begin{aligned}
A\begin{bmatrix}1\\1\\1\end{bmatrix}
&=
\begin{bmatrix}.4+.3+.3\\
.3 + .5 + .2\\
.3 + .2  + .5
\end{bmatrix}\\
&=1\begin{bmatrix}1\\1\\1\end{bmatrix}
\end{aligned}$$

altså er $\lambda=1$ en egenverdi med $(1,1,1)$ som korresponderende egenvektor.

### c)
Skriver vi inn kommandoen `eig` i matlab får vi følgende resultat:
```{matlab}
>> [V,D] = eig(A)
V =

  -8.1650e-01  -1.1926e-17   5.7735e-01
   4.0825e-01  -7.0711e-01   5.7735e-01
   4.0825e-01   7.0711e-01   5.7735e-01

D =

Diagonal Matrix

   0.10000         0         0
         0   0.30000         0
         0         0   1.00000
```

Dette forteller oss at utenom 1 er de to andre egenverdiene for $A$ $\lambda=.1$ og $\lambda=.3$. 
Vi finner at de korresponderende egenvektorene til $\lambda=.1$ og $\lambda=.3$ er henholdsvis $\textbf{v}=(-2,1,1)$ og $\textbf{v}=(0,-1,1)$. Vi kan verifisere at de to egenvektorene stemmer ved å teste

$$
A\begin{bmatrix}-2\\1\\1\end{bmatrix}
=\begin{bmatrix}
-.8 + .3 + .3\\
-.6 + .5 + .2\\
-.6 + .2 + .5
\end{bmatrix}
=\begin{bmatrix}-.2\\.1\\.1\end{bmatrix}
$$

og

$$
A\begin{bmatrix}0\\-1\\1\end{bmatrix}
=\begin{bmatrix}
-.3 + .3\\
-.5 + .2\\
-.2 + .5
\end{bmatrix}
=\begin{bmatrix}0\\-.3\\.3\end{bmatrix}
$$

så egenvektorene stemmer.

### d)
Vi setter $\textbf{v} _ 1 =(-2,1,1)$, $\textbf{v} _ 2 =(0,-1,1)$ og $\textbf{v} _ 3 =(1,1,1)$, og tilsvarende $\lambda_1=.1$, $\lambda_2=.3$ og $\lambda_3=1$. Vi ønsker å finne en vekting $\textbf{c}=(c_1,c_2,c_3)$ slik at $\begin{bmatrix}\textbf{v} _ 1& \textbf{v} _ 2 & \textbf{v} _ 3\end{bmatrix}\textbf{c}=(30,60,30)$. Dette kan gjøres ved radredusering for hånd, men vi velger å bruke matlab ettersom det er raskere:
```{matlab}
>> rref([-2,0,1,30;1,-1,1,60;1,1,1,30])
ans =

    1   -0    0    5
    0    1    0  -15
    0    0    1   40
```

Vi ser at vektingen $\textbf{c}=(5,-15,40)$ er den unike løsningen. 

Vi har altså $(30,60,30)=5\textbf{v} _ 1 - 15\textbf{v} _ 2 + 40 \textbf{v} _ 3$, så 

$$
\begin{aligned}
A^n (30,60,30)&=\lambda_1^n 5\textbf{v} _ 1 - \lambda_2^n 15\textbf{v} _ 2 + \lambda_3^n 40\textbf{v} _ 3\\
&=.1^n\, 5\textbf{v} _ 1 - .3^n\, 15\textbf{v} _ 2 + 1^n\, 40\textbf{v} _ 3
\end{aligned}
$$

Når $n$ går mot uendelig ser vi at siden $\lambda_1,\lambda_2<1$ vil de to første leddene gå mot 0 og vi vil stå igjen med $\displaystyle A^n(30,60,30)=\lim _ {n\to\infty} 1^n\, 40\textbf{v} _ 3 = 40\textbf{v} _ 3=(40,40,40)$.

### e)
![Figuren viser antall biler i hver by for hver dag.](./opg1e.pdf)
Figuren viser antall biler i hver by for hver dag #1 til dag #10.

# Oppgave 2
### a)
Vi har at Jacobideterminanten blir

$$
\begin{aligned}
\begin{vmatrix}
\frac{\partial x}{\partial u} & \frac{\partial x}{\partial v} & \frac{\partial x}{\partial w}\\
\frac{\partial y}{\partial u} & \frac{\partial y}{\partial v} & \frac{\partial y}{\partial w}\\
\frac{\partial z}{\partial u} & \frac{\partial z}{\partial v} & \frac{\partial z}{\partial w}
\end{vmatrix}
&=
\begin{vmatrix}
-w\sin u \cos v & -(R + w\cos u)\sin v & \cos u \cos v\\
-w\sin u \sin v & (R + w\cos u)\cos v & \cos u \sin v\\
w\cos u & 0 & \sin u
\end{vmatrix}\\
&= w\cos u \begin{vmatrix}
-(R + w\cos u)\sin v & \cos u \cos v\\
(R + w\cos u)\cos v & \cos u \sin v
\end{vmatrix}
 + \sin u \begin{vmatrix}
-w\sin u \cos v & -(R + w\cos u)\sin v\\
-w\sin u \sin v & (R + w\cos u)\cos v
\end{vmatrix}\\
&= - w\cos^2 u (R + w\cos u)(\sin^2 v + cos^2 v) - w\sin^2 u (R + w\cos u)(\sin^2 v + \cos^2 v)\\
&= -w(\cos^2 u + \sin^2 v)(R + w\cos u)(\sin^2 v + \cos^2 v)\\
&= -w(R + w\cos u)
\end{aligned}
$$

Dermed får vi at absoluttverdien av Jacobideterminanten blir $\displaystyle\left|\frac{\partial (x,y,z)}{\partial(u,v,w)}\right|=\left|-w(R + w\cos u)\right|=w(R + w\cos u)$.

### b)
Om vi lar $A$ være rommet begrenset av torusen. Vi kan da regne ut volumet til torusen som

$$
\begin{aligned}
V&=\iiint_A 1\,dxdydz\\
&=\iiint_A \left|\frac{\partial(x,y,z)}{\partial(u,v,w)}\right|dudvdw\\
&=\int_0^r\left(\int_0^{2\pi}\left(\int_0^{2\pi}w(R + w\cos u)dv\right)du\right)dw\\
&=2\pi\int_0^r\left(\int_0^{2\pi}w(R + w\cos u)du\right)dw\\
&=2\pi\int_0^r 2\pi wR \,dw\\
&=4\pi^2R\int_0^r w\,dw\\
&=2\pi^2Rr^2
\end{aligned}
$$
