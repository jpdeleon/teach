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

# Lecture 20–21 — Foundations of Statistical Mechanics: Equal A Priori Probabilities and the Law of Large Numbers

*Source: [NPTEL Classical Physics, Mod-01 Lec-20](https://www.youtube.com/watch?v=XIXQ38JnF0k&list=PL5E4E56893588CBA8&index=20)
(Classical statistical mechanics: Introduction) and
[Lec-21](https://www.youtube.com/watch?v=vpW1nBSviGY&list=PL5E4E56893588CBA8&index=22)
(Some probability distributions; isolated systems), Prof. V. Balakrishnan.*

[Lecture 13–14](lec13_dynamical_symmetry.md) closed on a sobering note: even the
three-body problem is generically **not integrable** — not because $10^{23}$ particles is
too many equations to write down, but because *three* interacting bodies already fail to
have enough constants of the motion in involution. Exact solvability runs out almost
immediately past two bodies, yet macroscopic matter — $\sim 10^{23}$ interacting
particles — behaves with almost boring regularity: gases settle into a definite pressure
and temperature, and stay there. Statistical mechanics is the resolution: give up on
solving the equations of motion and instead ask what almost every accessible state of the
system looks like, exactly the move that [Lecture 5–6](lec05_autonomous_dynamics.md)
previewed for chaotic systems — an **invariant density** on phase space, with long-time
averages computed as ensemble averages over that density rather than as limits of actual
trajectories. This lecture makes that move precise, starting from a single postulate.

## Thermal equilibrium and the Liouville equation

Operationally, a system is in **thermal equilibrium** when the time averages of every
macroscopic quantity — pressure, energy, and the like — are independent of time, even
though individual microscopic degrees of freedom (a single molecule's velocity) fluctuate
constantly. Since these averages are computed against a phase-space probability density
$\rho(q,p,t)$, the only way *every* moment of *every* observable can be time-independent is
for $\rho$ itself to be time-independent. From the [Liouville equation](
lec10_hamiltonian_dynamics.md), $\partial\rho/\partial t = -\{\rho, H\}$ — note the sign,
opposite to the equation of motion $dF/dt = \{F,H\} + \partial F/\partial t$ for an
ordinary observable $F$. That flipped sign is the reason $\rho$ is *not* itself a physical
observable: it obeys the *conjugate* equation, and it is precisely what lets $\rho$ stay
constant along the flow while the observables built from it still evolve correctly.
Setting $\partial\rho/\partial t = 0$ forces $\rho_{\rm eq}$ to be **a function of the
constants of the motion alone** — for an isolated system in a fixed inertial frame with no
extra symmetry, that means a function of $H$ alone (having already used up momentum,
angular momentum, and center-of-mass conservation by choice of reference frame).

For an isolated system with total energy known to lie in a shell $E$ to $E+\delta E$
(any measurement carries *some* finite resolution), the only sensible choice consistent
with $\rho_{\rm eq}=\rho(H)$ is a **uniform** density on that shell and zero elsewhere — a
delta function pinned to the energy surface. This is the **fundamental postulate of
equilibrium statistical mechanics**:

> In thermal equilibrium, all accessible microstates of an isolated system are equally
> probable.

Nothing here is derived from mechanics alone — dynamics can prove the converse (uniform
probability at one instant stays uniform forever, since it's already an equilibrium
density) but not the postulate itself, which is an extra physical input layered on top of
Hamiltonian dynamics. What licenses it physically is the same picture used for chaotic
systems: a generic many-body Hamiltonian system is expected to be **ergodic and mixing**
on its energy shell, so that a small starting bundle of trajectories eventually samples
the whole shell uniformly — the fundamental postulate is the *equilibrium snapshot* of
that mixing process.

## Microstates, macrostates, and counting

A **microstate** specifies the generalized coordinates and momenta of *every* constituent
of the system — maximal, microscopic detail. A **macrostate** specifies only some coarse,
collective description — total energy, total momentum, and the like. Given a total energy
$E$, only some microstates are compatible with it — no particle can individually carry
more kinetic energy than the whole system has — so the fundamental postulate really refers
to *accessible* microstates: those consistent with whatever macroscopic constraints have
been imposed.

Phase space is continuous, so a literal point has probability zero, and the number of
"microstates" in any energy shell is uncountably infinite — the postulate as stated is not
yet usable. Fixing this requires a resolution scale, and nature happens to supply exactly
one: **Heisenberg's uncertainty relation**, $\Delta q\,\Delta p \gtrsim \hbar$, means a
conjugate pair $(q,p)$ can never be specified more sharply than a cell of area
$\sim h$ — not a measurement limitation, but a statement that a quantum system simply does
not possess a state with both $q$ and $p$ arbitrarily precise. Carving $6N$-dimensional
phase space into cells of volume $\sim h^{3N}$ (three conjugate pairs per particle, in
three spatial dimensions) turns "number of microstates" into an honest, finite count:

$$
\Omega(E) = \frac{\text{phase-space volume of the energy shell}}{h^{3N}},
$$

and each of the $\Omega(E)$ cells is equally probable, with probability $1/\Omega(E)$.
Classical statistical mechanics runs entirely on this scaffolding — the precise numerical
value of the cell size turns out to drop out of every thermodynamic quantity, a
consequence of always working with $\ln\Omega$ (see below), but *that some such cell
exists at all* is essential, and it is where quantum mechanics quietly underwrites
classical statistical mechanics from the start.

## A toy model: coins, and why macrostates dominate

To make "microstate" versus "macrostate" completely concrete, take $N$ distinguishable,
unbiased coins. A **microstate** is a specific string of $N$ heads/tails outcomes — there
are $2^N$ of them. A **macrostate** is just the pair $(H,T)$ with $H+T=N$ — there are only
$N+1$ of *those*. The number of macrostates grows only *linearly* in $N$; the number of
microstates grows *exponentially*. That single mismatch is the seed of every result below.

The probability of a given macrostate $H$ is the number of microstates compatible with it,
times the probability of any one of them:

$$
P(H) = \binom{N}{H} p^H q^{N-H}, \qquad q = 1-p,
$$

the **binomial distribution** — $\binom{N}{H}$ counts the orderings, and $p^Hq^{N-H}$ is
the probability of any particular one, since the coins are independent. Its **generating
function**, $f(x) \equiv \sum_H P(H)\,x^H = (px+q)^N$, turns every moment into a
derivative evaluated at $x=1$:

$$
\overline H = f'(1) = Np, \qquad
\overline{H^2}-\overline H^2 = f''(1)+f'(1)-f'(1)^2 = Npq,
$$

so the standard deviation is $\sqrt{Npq}$ and the **relative fluctuation** is

$$
\frac{\Delta H}{\overline H} = \sqrt{\frac{q}{Np}} \;\propto\; \frac{1}{\sqrt N}.
$$

For $N=10^3$ this is already about $1\%$; for $N\sim10^{24}$ it is about one part in
$10^{12}$ — utterly negligible. This is *why* thermodynamics can get away with talking
about averages alone: the macrostate with the overwhelmingly largest number of contributing
microstates dominates so completely that fluctuations away from it are unobservable, even
though, strictly, *every* microstate — including the bizarre one where a single particle
hoards nearly all the energy — remains exactly as probable as any other.

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
from scipy.special import comb
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


P_HEAD = 0.5
N_CASES = [10, 50, 200, 1000]


def binomial_pmf(N, p):
    H = np.arange(0, N + 1)
    logpmf = (np.log(comb(N, H, exact=False)) + H * np.log(p)
              + (N - H) * np.log(1 - p))
    return H, np.exp(logpmf)


def fig_binomial_to_gaussian():
    z_grid = np.linspace(-5, 5, 400)
    gaussian = np.exp(-z_grid ** 2 / 2) / np.sqrt(2 * np.pi)

    fig = go.Figure()
    fig.add_trace(go.Scatter(x=z_grid, y=gaussian, mode="lines",
                              line=dict(color="gray", width=2, dash="dot"),
                              name="standard Gaussian"))
    H0, pmf0 = binomial_pmf(N_CASES[0], P_HEAD)
    mean0, sd0 = N_CASES[0] * P_HEAD, np.sqrt(N_CASES[0] * P_HEAD * (1 - P_HEAD))
    z0 = (H0 - mean0) / sd0
    fig.add_trace(go.Bar(x=z0, y=pmf0 * sd0, width=1.0 / sd0,
                          marker=dict(color="steelblue"), name="binomial P(H)",
                          opacity=0.75))

    frames = []
    for k, N in enumerate(N_CASES):
        H, pmf = binomial_pmf(N, P_HEAD)
        mean, sd = N * P_HEAD, np.sqrt(N * P_HEAD * (1 - P_HEAD))
        z = (H - mean) / sd
        frames.append(go.Frame(
            data=[go.Scatter(x=z_grid, y=gaussian), go.Bar(x=z, y=pmf * sd, width=1.0 / sd)],
            traces=[0, 1], name=f"{k}",
            layout=dict(title=f"N = {N} coins  (relative fluctuation ≈ {1/np.sqrt(N):.3f})"),
        ))
    fig.frames = frames

    fig.update_xaxes(title_text="(H − mean) / standard deviation", range=[-5, 5])
    fig.update_yaxes(title_text="rescaled probability density", range=[0, 0.5])
    fig.update_layout(
        title=f"N = {N_CASES[0]} coins  (relative fluctuation ≈ {1/np.sqrt(N_CASES[0]):.3f})",
        width=760, height=440, bargap=0,
        updatemenus=[dict(type="buttons", showactive=False, y=1.2, x=1.0, xanchor="right",
            buttons=[dict(label="▶ Grow N", method="animate",
                          args=[None, dict(frame=dict(duration=1400, redraw=True),
                                            fromcurrent=True, transition=dict(duration=300))]),
                     dict(label="⏸ Pause", method="animate",
                          args=[[None], dict(mode="immediate")])])],
        sliders=[dict(active=0, x=0.08, len=0.9,
            steps=[dict(method="animate", label=f"N={N}", args=[[f"{k}"],
                        dict(mode="immediate", frame=dict(redraw=True))])
                   for k, N in enumerate(N_CASES)])],
    )
    return fig


show_fig(fig_binomial_to_gaussian())
```

Rescaled by its own mean and standard deviation, the lumpy binomial distribution collapses
onto the same universal Gaussian curve as $N$ grows — the width in absolute terms is
growing like $\sqrt N$, but relative to the mean (which grows like $N$) it shrinks to
nothing.

## Stirling's approximation

Making this precise for astronomically large $N$ requires controlling $N!$, and the
standard tool is **Stirling's approximation**. Starting from the integral representation
of the factorial, $n! = \int_0^\infty x^n e^{-x}\,dx = \int_0^\infty e^{n\ln x - x}\,dx$,
the exponent $f(x) = n\ln x - x$ is extremized at $f'(x) = n/x - 1 = 0 \Rightarrow x = n$,
with $f''(n) = -n/x^2\big|_{x=n} = -1/n$. Expanding $f$ to second order about this peak and
integrating the resulting Gaussian (**Laplace's method**),

$$
n! \approx e^{f(n)} \int_{-\infty}^{\infty} e^{\frac12 f''(n)(x-n)^2}\,dx
       = n^n e^{-n}\sqrt{2\pi n},
$$

so $\ln n! \approx n\ln n - n$ to leading order. This is the workhorse identity for
everything that follows: it turns unmanageable factorials of $\sim 10^{23}$ into tractable
logarithms.

## From binomial, to Poisson, to Gaussian

The binomial distribution itself simplifies in two successive limits relevant to a real
gas. Picture a sub-volume $v$ inside a much larger container of volume $V$ holding $N$
independent particles at fixed density $N/V$; the probability that a given particle sits
inside $v$ is $p = v/V$. In the **thermodynamic limit** ($N,V\to\infty$ at fixed density,
so $p\to 0$ while $\overline n \equiv Np$ stays fixed), Stirling's approximation turns the
binomial distribution into the **Poisson distribution**,

$$
P(n) \to \frac{\overline n^{\,n}}{n!}e^{-\overline n},
$$

whose defining property is that **variance equals mean**, $\sigma^2 = \overline n$ — so the
relative fluctuation again scales as $1/\sqrt{\overline n}$. When $\overline n \gg 1$ as
well, the discrete Poisson distribution smooths into a continuous **Gaussian** peaked at
$\overline n$ with the same variance — the same qualitative collapse the coin example
already showed directly.

## Setting up an isolated system in two parts

Return to a large isolated system with total energy $E_{\rm total}$, volume $V_{\rm
total}$, and particle number $N_{\rm total}$, and imagine partitioning it into two
subsystems $A$ and $B$ in thermal contact, with $A$ carrying energy $E$ and $B$ carrying
$E' \approx E_{\rm total}-E$. Assuming the forces are short-ranged, the number of degrees
of freedom actually engaged in the $A$–$B$ interaction at any instant scales with the
boundary area ($\sim N^{2/3}$) while the bulk of each subsystem scales as $N$ — negligible
in the thermodynamic limit, so the interaction energy itself can be dropped and the total
number of accessible microstates factorizes: $\Omega_{\rm total}(E,E') \approx
\Omega(E)\,\Omega'(E')$. Applying the fundamental postulate to the *whole* isolated system
gives the probability that $A$ carries energy $E$:

$$
P(E) = \frac{\Omega(E)\,\Omega'(E_{\rm total}-E)}{\Omega_{\rm total}(E_{\rm total})}.
$$

## The scale of the numbers involved

For $N$ weakly-interacting particles with total energy $E \approx \sum_i \varepsilon_i$
split roughly evenly, $\Omega(E)$ scales like $E$ raised to a power proportional to $N$ —
an astronomically, exponentially increasing function of $E$ for macroscopic $N$. Numbers
of this size are only tractable in logarithms, which is exactly why every calculation from
here on works with $\ln\Omega$ rather than $\Omega$ itself. [Lecture 22–23](
lec22_microcanonical_ensemble.md) picks up precisely here — extremizing $P(E)$ above is
what turns this factorized probability into a definition of temperature, entropy, and
the rest of thermodynamics.
