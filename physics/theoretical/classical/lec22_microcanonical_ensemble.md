---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

# Lecture 22–23 — The Microcanonical Ensemble and the Structure of Thermodynamics

*Source: [NPTEL Classical Physics, Mod-01 Lec-22](https://www.youtube.com/watch?v=hfS6zkcKBGk&list=PL5E4E56893588CBA8&index=23)
(The microcanonical ensemble) and
[Lec-23](https://www.youtube.com/watch?v=Fi9Z5DxVsu0&list=PL5E4E56893588CBA8&index=24)
(Thermodynamics), Prof. V. Balakrishnan.*

[Lecture 20–21](lec20_statistical_mechanics.md) split an isolated system into two weakly
interacting parts $A$ and $B$ and, from the single postulate that all accessible
microstates of the whole are equally probable, arrived at

$$
P(E) = \frac{\Omega(E)\,\Omega'(E_{\rm total}-E)}{\Omega_{\rm total}(E_{\rm total})}.
$$

This lecture extremizes that expression. What falls out is not just "the most probable
energy split" — it is temperature, entropy, and essentially the entire structure of
classical thermodynamics, derived rather than assumed.

## The density of states for a free particle

Before extremizing $P(E)$, it helps to know how $\Omega(E)$ actually grows with $E$. For a
single free particle of mass $m$ confined to volume $V$, the number of accessible
microstates with energy up to $\varepsilon$ is the phase-space volume of that region,
measured in cells of size $h^3$:

$$
\phi(\varepsilon) = \frac{1}{h^3}\int_{V} d^3r \int_{|\vec p\,|\le\sqrt{2m\varepsilon}} d^3p
   = \frac{V}{h^3}\cdot\frac{4\pi}{3}\big(2m\varepsilon\big)^{3/2} \;\propto\; V\,\varepsilon^{3/2}.
$$

Differentiating gives the **density of states**, $\rho(\varepsilon) \equiv
d\phi/d\varepsilon \propto \varepsilon^{1/2}$ — the number of microstates per unit energy
interval, a quantity that reappears constantly from here through the rest of statistical
mechanics. The exponents have a clean origin: the power $3/2$ splits into a factor of $3$
from the number of *spatial* dimensions (momentum space is a $3$-sphere; its surface
"area" scales as $p^2$, i.e. $\varepsilon^1$, before the extra $1/2$ below) and a factor of
$1/2$ from the *quadratic* dispersion relation $\varepsilon = p^2/2m$ — the
non-relativistic limit of $\varepsilon^2 = c^2p^2+m^2c^4$ once the rest energy $mc^2$ is
dropped. In general spatial dimension $d$, $\phi(\varepsilon)\propto\varepsilon^{d/2}$ and
$\rho(\varepsilon)\propto\varepsilon^{d/2-1}$:

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import plotly.graph_objects as go
from IPython.display import HTML

_plotlyjs_loaded = False


def show_fig(fig):
    """Embed a Plotly figure as self-contained HTML+JS. include_mathjax=False
    avoids Plotly's legacy MathJax v2 loader colliding with Sphinx's MathJax
    v3. plotly.js itself is embedded only the first time this runs on a page.
    """
    global _plotlyjs_loaded
    html = fig.to_html(full_html=False, include_mathjax=False,
                        include_plotlyjs=not _plotlyjs_loaded,
                        config={"responsive": True})
    _plotlyjs_loaded = True
    return HTML(html)


eps = np.linspace(0.02, 3.0, 400)


def fig_density_of_states():
    fig = go.Figure()
    styles = {1: ("firebrick", "d = 1  (ρ ∝ ε^(-1/2), diverges)"),
              2: ("darkorange", "d = 2  (ρ = const — quantum Hall)"),
              3: ("steelblue", "d = 3  (ρ ∝ ε^(1/2), ordinary gas)")}
    for d, (color, label) in styles.items():
        rho = eps ** (d / 2 - 1)
        rho = rho / rho[np.argmin(np.abs(eps - 1.0))]
        fig.add_trace(go.Scatter(x=eps, y=rho, mode="lines",
                                  line=dict(color=color, width=2.5), name=label))
    fig.update_xaxes(title_text="energy ε (arbitrary units)")
    fig.update_yaxes(title_text="density of states ρ(ε), normalized at ε = 1", range=[0, 3])
    fig.update_layout(title="Density of states ρ(ε) ∝ ε^(d/2 − 1) for a free particle",
                       width=700, height=460)
    return fig


show_fig(fig_density_of_states())
```

Three dimensions gives ordinary $\sqrt\varepsilon$ growth; two dimensions gives a
**constant** density of states, the reason electrons confined to a plane (as in the
quantum Hall effect) behave so differently from an ordinary 3D gas; one dimension gives a
density of states that **diverges** as $\varepsilon\to0$ — low-energy states become more
crowded, not less. For $N$ weakly-interacting particles sharing the total energy roughly
evenly, $\Omega(E)$ compounds this into $E$ raised to a power proportional to $N$ — an
astronomically increasing function of energy, exactly as [Lecture 20–21](
lec20_statistical_mechanics.md) argued on general grounds.

## Extremizing $P(E)$: the statistical definition of temperature

With $\Omega(E)$ a rapidly increasing function and $\Omega'(E_{\rm total}-E)$ a rapidly
*decreasing* one, their product is sharply peaked, and locating the **most probable**
macrostate means extremizing $P(E)$ — equivalently, since these are astronomically large
numbers, extremizing $\ln P(E)$:

$$
\frac{\partial \ln P(E)}{\partial E} = 0
\;\Longrightarrow\;
\frac{\partial \ln\Omega(E)}{\partial E}\bigg|_A = \frac{\partial \ln\Omega'(E')}{\partial E'}\bigg|_B,
$$

using $E' = E_{\rm total}-E$ so that $\partial/\partial E = -\partial/\partial E'$. The
left side depends only on properties of $A$, the right side only on properties of $B$ —
two systems that can be physically completely different (a jar of oil in equilibrium with
the surrounding air) — yet in equilibrium this one combination matches across the
boundary. That combination is defined to be the (inverse) **temperature**:

$$
\beta(E) \equiv \frac{\partial \ln\Omega(E)}{\partial E} \equiv \frac{1}{k_BT(E)}.
$$

Note the direction of dependence: statistical mechanics makes $T$ a function of $E$, the
reverse of the usual thermodynamic habit of treating $E$ (or $U$) as a function of $T$.
Nothing in this definition *requires* $\Omega(E)$ to increase monotonically forever —
systems with a bounded energy spectrum can have $\Omega(E)$ rise and then fall, giving a
region where $\beta<0$, i.e. **negative absolute temperature** — a real phenomenon in
certain spin systems, invisible to the free-particle intuition where $\Omega(E)\propto
E^{3N/2}$ climbs without bound.

Repeating the same argument for exchange of volume and particle number (rather than
energy) across the $A$–$B$ boundary gives two more matching conditions, identified as
equal pressure and equal chemical potential in equilibrium. All three conditions are
partial derivatives of a single function, which is given a name because it — not
$\Omega$ itself — is what appears in every physical formula: the **entropy**,

$$
S(E,V,N) \equiv k_B\ln\Omega(E,V,N) \qquad \text{(Boltzmann's formula).}
$$

## From statistical entropy to the first law

Written in terms of $S$, the three matching conditions become $\partial S/\partial
E|_{V,N} = 1/T$, $\partial S/\partial V|_{E,N}=P/T$, $\partial S/\partial
N|_{E,V}=-\mu/T$ — the **entropy representation**,

$$
dS = \frac1T\,dE + \frac{P}{T}\,dV - \frac{\mu}{T}\,dN,
$$

equivalently the familiar **energy representation** $dE = T\,dS - P\,dV + \mu\,dN$, with
$T=\partial E/\partial S|_{V,N}$, $P=-\partial E/\partial V|_{S,N}$, $\mu=\partial
E/\partial N|_{S,V}$. This *is* the first law of thermodynamics — not assumed, but read
off directly from the statistical definition of entropy and the equilibrium conditions
derived above.

## Extensivity, Euler's relation, and Gibbs–Duhem

The first law only ever gives *increments* $dE$ — it says nothing about the absolute value
of $E$ itself. That extra input is **extensivity**: in the thermodynamic limit ($N,V\to
\infty$ at fixed density), $E$ is assumed to be a **homogeneous function of degree 1** in
the extensive variables $S,V,N$ — doubling all three at once exactly doubles $E$.
**Euler's theorem** for a degree-1 homogeneous function then gives immediately

$$
E = S\frac{\partial E}{\partial S} + V\frac{\partial E}{\partial V} + N\frac{\partial E}{\partial N}
  = TS - PV + \mu N \qquad \textbf{(Euler relation)}.
$$

Two useful facts fall out at once. First, $E - TS + PV = \mu N$, and the left side is
exactly the **Gibbs free energy** $G$ (defined via a Legendre transform below) — so
$\mu = G/N$, the chemical potential is simply the Gibbs free energy *per particle*.
Second, differentiating the Euler relation and subtracting the first law term by term
leaves

$$
S\,dT - V\,dP + N\,d\mu = 0 \qquad \Longrightarrow \qquad d\mu = v\,dP - s\,dT,
$$

the **Gibbs–Duhem relation** ($v=V/N$, $s=S/N$ the specific volume and entropy) — it says
$\mu$ is a function of the *intensive* pair $(P,T)$ alone, and generalizes to $\sum_i
X_i\,dF_i = 0$ for any set of conjugate force–flux pairs $(F_i,X_i)$ satisfying $E=\sum_i
F_iX_i$. Both relations depend on extensivity actually holding — self-gravitating systems,
where the interaction energy is *not* short-ranged in the sense [Lecture 20–21](
lec20_statistical_mechanics.md) assumed, are a standard example where it fails.

## The thermodynamic potentials as Legendre transforms

$E(S,V,N)$ is inconvenient whenever $S$ is hard to control directly — exactly the kind of
situation [Lecture 10–12](lec10_hamiltonian_dynamics.md)'s Legendre transform was built
for, trading an inconvenient independent variable for its conjugate slope. Applied
repeatedly to $E$:

| Potential | Variables | Definition |
|---|---|---|
| Internal energy $E$ | $S,V,N$ | — |
| Enthalpy $H$ | $S,P,N$ | $E+PV$ |
| Helmholtz free energy $F$ | $T,V,N$ | $E-TS$ |
| Gibbs free energy $G$ | $T,P,N$ | $E-TS+PV$ |
| Grand potential $\Omega_{\rm gr}$ | $T,V,\mu$ | $E-TS-\mu N = -PV$ |

$F$ and $G$ are the two used constantly in practice; the grand potential is the one that
pairs with a **grand canonical** ensemble (fixed $\mu$ rather than fixed $N$) rather than
the canonical ensemble of [Lecture 24–25](lec24_canonical_ensemble.md). Differentiating a
potential with respect to its natural variables always returns another thermodynamic
quantity — $S=-\partial F/\partial T|_{V,N}=-\partial G/\partial T|_{P,N}$,
$V=\partial G/\partial P|_{T,N}$, $\mu = \partial F/\partial N|_{T,V} = \partial G/\partial
N|_{T,P}$ — the reason these are called *potentials* at all, by direct analogy with a
mechanical potential whose gradient is a force. Throughout, quantities come in **conjugate
pairs** $(T,S)$, $(P,V)$, $(\mu,N)$ whose product always has dimensions of energy; the
extensive member of each pair is a **state variable**, the intensive member a **field
variable** (generalizing to $\vec E\cdot d\vec P$ for a dielectric or $\vec B\cdot d\vec M$
for a magnet).

## Response functions and stability

*Second* derivatives of the potentials are physically **response functions**. From
$dQ=T\,dS$ at constant $V,N$, the heat capacity is $C_V \equiv T\,\partial S/\partial
T|_{V,N} = -T\,\partial^2F/\partial T^2|_{V,N}$ — a second derivative of $F$. Thermodynamic
**stability** requires equilibrium states to sit at a genuine minimum of the appropriate
potential (Le Chatelier's principle), which forces convexity: $C_V\ge0$, $C_P\ge0$ (with
$C_P>C_V$), and the isothermal compressibility $\kappa_T=-\frac1V\partial V/\partial
P|_{T,N}=-\frac1V\partial^2G/\partial P^2|_{T,N}\ge0$ — a fluid is never allowed to *expand*
in response to increased pressure. Since every potential is a function of three
independent variables, there are three possible pairs of mixed second derivatives per
potential, giving the **Maxwell relations** — up to $18$ of them across the six potentials
above (only $4$ independent ones if $N$ is held fixed throughout).

## Worked example: the van der Waals correction and its microscopic origin

The ideal-gas law $PV=Nk_BT$ ignores that real molecules interact. The empirical **van der
Waals equation of state**,

$$
P = \frac{Nk_BT}{V-Nb} - a\left(\frac{N}{V}\right)^2,
$$

corrects for this in two ways whose *microscopic* origin is worth tracing. The
intermolecular potential $V(r)$ between two neutral molecules has a generic shape: a
short-range **repulsive** core and a longer-range **attractive** tail. The repulsion is
almost entirely a quantum effect — the **Pauli exclusion principle** forbidding two
electrons from occupying the same state — empirically modeled as $\sim 1/r^{12}$; it is
what the excluded volume $b$ in $V-Nb$ crudely represents. The attraction is the **van der
Waals force**: even a spherically symmetric, non-polar molecule has *instantaneous*
charge fluctuations that momentarily create a dipole moment $\vec p_1$; that dipole
produces a field $E\sim p_1/r^3$ at a neighboring molecule, inducing a dipole there
proportional to that field ($p_2=\alpha E$), and the resulting interaction energy
$U\sim p_2 E \sim E^2 \sim 1/r^6$ is always attractive — the origin of the $1/r^6$ tail in
the standard **Lennard-Jones** ("6-12") potential, $V(r) = V_0\big[(a/r)^{12}-(a/r)^6\big]$.
The coefficient $a$ in van der Waals' equation has a similarly simple origin: treating
every molecule as equally affected by every other (the crudest **mean-field**
approximation), the interaction energy per unit volume scales as (density)$^2 \propto
N^2/V^2$. The van der Waals equation is the special, fully degenerate case of the
systematic **virial expansion** $PV = Nk_BT\big(1+B_2(T)\,N/V+\cdots\big)$, in which every
virial coefficient collapses into the single empirical parameter $a$.

## Where this is headed

Everything above followed from a single postulate about an isolated system's own energy
shell — but real experiments rarely isolate a system this completely; more often a small
object sits inside a much larger environment that can freely exchange energy with it.
[Lecture 24–25](lec24_canonical_ensemble.md) shrinks $A$ down to exactly that limit,
turning the same postulate into the **canonical ensemble** and the Boltzmann factor
$e^{-\beta\varepsilon}$ that underlies the rest of statistical mechanics.
