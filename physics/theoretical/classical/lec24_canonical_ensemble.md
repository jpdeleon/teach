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

# Lecture 24–25 — The Canonical Ensemble and the Classical Ideal Gas

*Source: [NPTEL Classical Physics, Mod-01 Lec-24](https://www.youtube.com/watch?v=rDHQ60CXDbU&list=PL5E4E56893588CBA8&index=25)
(The canonical ensemble) and
[Lec-25](https://www.youtube.com/watch?v=-0S0ScEOH5w&list=PL5E4E56893588CBA8&index=26)
(Connection between statistical mechanics and thermodynamics), Prof. V. Balakrishnan.*

[Lecture 22–23](lec22_microcanonical_ensemble.md) built the entire structure of
thermodynamics from one postulate applied to an isolated system's own energy shell. But
most real systems of interest — a single atom, a small protein, a cup of coffee — are not
isolated at all; they sit inside a much larger environment that can freely exchange energy
with them. This lecture asks what the microcanonical postulate implies for a *small*
subsystem embedded in a huge **heat bath**, and the answer is the single most-used formula
in all of statistical mechanics: the Boltzmann factor $e^{-\beta\varepsilon}$.

## The microcanonical distribution is a sharp Gaussian

First, a sanity check on [Lecture 22–23](lec22_microcanonical_ensemble.md)'s claim that
fluctuations are negligible for macroscopic systems. Expanding $\ln P(E)$ in a Taylor
series about its maximum $\bar E$ — the first-derivative term vanishes there by
definition, and the second-derivative coefficient is negative since $\bar E$ is a maximum
— gives

$$
P(E) \approx \text{const} \times \exp\!\left[-\frac{(E-\bar E)^2}{2\sigma^2}\right],
\qquad \sigma^2 \propto \bar E,
$$

a **Gaussian**, sharply peaked, with a variance proportional to the mean — the same
Poisson-like scaling met twice already in [Lecture 20–21](lec20_statistical_mechanics.md).
Since $\bar E$ scales with the number of degrees of freedom, the relative width
$\sigma/\bar E \sim 1/\sqrt{\bar E}$ is utterly negligible for $N\sim10^{24}$: this is
precisely why thermodynamics can call $\bar E$ *the* internal energy $U$ and never mention
fluctuations at all. But this argument used the fact that *both* subsystems $A$ and $B$
have huge numbers of degrees of freedom — exactly the assumption about to be dropped.

## Shrinking the subsystem: the Boltzmann factor, derived

Let $A$ now be a small system — a handful of degrees of freedom — immersed in a heat bath
$B$ with far more, so that $A$'s energy $\varepsilon$ satisfies $\varepsilon \ll E_{\rm
total}$. The probability that $A$ has energy $\varepsilon$ is still governed by the
fundamental postulate applied to the whole isolated system, but now the roles are
lopsided: $A$'s own $\Omega(\varepsilon)$ plays no part in fixing $P(\varepsilon)$, because
it is entirely $B$'s response that matters,

$$
P(\varepsilon) = \frac{\Omega'(E_{\rm total}-\varepsilon)}{\Omega_{\rm total}(E_{\rm total})}.
$$

Since $\varepsilon \ll E_{\rm total}$, Taylor-expand $\ln\Omega'(E_{\rm
total}-\varepsilon)$ to *first* order in $\varepsilon$ about $E_{\rm total}$ — higher
orders are negligible precisely because $B$ is huge:

$$
\ln\Omega'(E_{\rm total}-\varepsilon) \approx \ln\Omega'(E_{\rm total})
   - \varepsilon\,\frac{\partial\ln\Omega'}{\partial E'}\bigg|_{E_{\rm total}}
   = \text{const} - \beta\varepsilon,
$$

using exactly the definition of inverse temperature from [Lecture 22–23](
lec22_microcanonical_ensemble.md), $\beta \equiv \partial\ln\Omega'/\partial E'$, now
evaluated for the bath. Exponentiating,

$$
P(\varepsilon) \propto e^{-\beta\varepsilon}.
$$

This is the **Boltzmann factor**, and the derivation is worth pausing on: it is not a
separate postulate bolted onto the microcanonical one, but a direct consequence of it in
the limit of a small system coupled to a large bath. All of $B$'s overwhelming internal
complexity — its own energy levels, its own dynamics — collapses into exactly **one**
number, its temperature. $A$ itself is *not* in a definite energy state; it is
constantly being driven through a whole distribution of states by the bath, and — for a
quantum system — occupies not even a superposition of energy eigenstates but a genuine
statistical **mixture**.

## The partition function

Normalizing $P(\varepsilon_j) = e^{-\beta\varepsilon_j}/Z$ over every accessible state $j$
(not merely every *level* — degenerate states must each be counted) defines the
**canonical partition function**,

$$
Z(\beta,V,N) = \sum_{\text{states } j} e^{-\beta\varepsilon_j}
             = \int_0^\infty \rho(\varepsilon)\,e^{-\beta\varepsilon}\,d\varepsilon,
$$

the continuum form using the density of states $\rho(\varepsilon)$ derived in [Lecture
22–23](lec22_microcanonical_ensemble.md). $Z$ is exactly a **Laplace transform** of
$\rho(\varepsilon)$ — a moment-generating function with $\beta$ playing the role of
transform variable — and this is the split that makes the whole formalism work: $Z$
carries *all* the system's own microscopic dynamics through $\rho(\varepsilon)$, while the
weight $e^{-\beta\varepsilon}$ carries *only* the bath's temperature. Different physical
systems differ only through $\rho(\varepsilon)$; the exponential factor is universal.

## Average energy and the variance — $C_V$ derived, not assumed

Differentiating $\ln Z$ with respect to $\beta$ gives the average (internal) energy
directly:

$$
\overline\varepsilon = \frac{\sum_j \varepsilon_j\,e^{-\beta\varepsilon_j}}{Z}
   = -\frac{\partial \ln Z}{\partial \beta} \equiv U.
$$

A second derivative gives the **variance** of the energy — and, converting from $\beta$ to
$T$ via $d\beta/dT=-1/(k_BT^2)$,

$$
\operatorname{Var}(\varepsilon) = \frac{\partial^2 \ln Z}{\partial \beta^2}
   = -\frac{\partial U}{\partial \beta} = k_BT^2\,\frac{\partial U}{\partial T}\bigg|_{V,N}
   = k_BT^2\,C_V.
$$

Two things follow immediately. First, since a variance can never be negative, **$C_V\ge0$
is now a proven statistical fact** rather than an empirical assumption bolted onto
thermodynamics. Second — and this is the real payoff — $C_V$, which thermodynamics can
only ever treat as an *input* parameter to be measured, is now **calculable from first
principles**: give the energy levels, and the fluctuation formula hands back the specific
heat directly.

## Connecting back to thermodynamics: $F = -k_BT\ln Z$

Apply the same peaked-product argument used for $\Omega(E)\Omega'(E')$ in [Lecture 20–21](
lec20_statistical_mechanics.md) directly to the integral defining $Z$: $\rho(\varepsilon)$
increases rapidly, $e^{-\beta\varepsilon}$ decreases rapidly, so the integrand is sharply
peaked near some $\bar\varepsilon$, and to excellent approximation

$$
Z \approx e^{-\beta\bar\varepsilon}\,\Omega(\bar\varepsilon)
\quad\Longrightarrow\quad
-k_BT\ln Z = \bar\varepsilon - k_BT\ln\Omega(\bar\varepsilon) = U - TS,
$$

using Boltzmann's formula $S=k_B\ln\Omega$. But $U-TS$ is exactly the **Helmholtz free
energy** $F$ from [Lecture 22–23](lec22_microcanonical_ensemble.md) — so

$$
\boxed{F = -k_BT\ln Z.}
$$

This single formula is the bridge between microscopic dynamics ($Z$, computed from the
system's own energy levels) and macroscopic thermodynamics (every quantity derivable from
$F$ by differentiation) — and testing it against a known result is the cleanest way to
confirm everything above is self-consistent.

## Worked example: the classical ideal gas, derived from $Z$

Take $N$ independent, point particles of mass $m$ in volume $V$, in contact with a bath at
temperature $T$. Since interactions are neglected, the total energy is additive,
$E = \sum_i \varepsilon_i$, and the exponential Boltzmann weight turns this sum into a
**product**: $Z = z_1^N$, where $z_1$ is the single-particle partition function,

$$
z_1 = \frac{1}{h^3}\int_V d^3r \int d^3p\; e^{-\beta p^2/2m}
    = \frac{V}{h^3}\left(\frac{2\pi m}{\beta}\right)^{3/2}
    = V\left(\frac{2\pi m k_BT}{h^2}\right)^{3/2},
$$

a standard Gaussian integral. Then $F = -Nk_BT\big[\ln V + \tfrac32\ln(2\pi mk_BT/h^2)\big]$,
and the pressure follows by direct differentiation,

$$
P = -\frac{\partial F}{\partial V}\bigg|_{T,N} = \frac{Nk_BT}{V}
\quad\Longrightarrow\quad
PV = Nk_BT,
$$

the classical ideal-gas law, recovered from first principles — exactly the check that
validates $F=-k_BT\ln Z$ and everything built on it. The average energy follows just as
directly, $U=-\partial\ln Z/\partial\beta = \tfrac32 Nk_BT$: each of the three
momentum components contributes $\tfrac12k_BT$, the **equipartition theorem** for any
degree of freedom that enters the Hamiltonian quadratically — the same $\tfrac12$ traces
back to the Gaussian integral above, and would become $\tfrac14k_BT$ for a quartic term
instead, as in an anharmonic oscillator's potential energy. Combining $U$ and $P$ gives
$P = \tfrac23\,U/V$ — the $2$ from the quadratic dispersion, the $3$ from the spatial
dimension, a relation that survives (with different numbers) even for quantum gases; for
photons, with linear dispersion, it becomes $P=U/3V$.

## The Gibbs paradox and its fix

Differentiating $F$ for $S=-\partial F/\partial T$ produces a term $Nk_B\ln V$ — but
physically, doubling $V$, $N$, and nothing else at fixed $T$ should exactly double $S$; a
bare, un-divided $V$ inside the logarithm wrecks that extensivity. The culprit is
overcounting: treating the $N$ particles as *distinguishable* counts every permutation of
identical particles among occupied states as a *different* microstate, when physically it
is the same one. The fix — valid whenever the number of available single-particle states
vastly exceeds $N$, so that two particles landing in the same state is negligibly rare —
is to divide by $N!$:

$$
Z_{\rm corrected} = \frac{z_1^{\,N}}{N!}.
$$

Using Stirling's approximation, $N!\approx N^Ne^{-N}$, the correction effectively replaces
$V \to V/N$ inside the logarithm — restoring exactly the extensive dependence that was
missing, and giving the properly extensive **Sackur–Tetrode** entropy. Two compensating
"mistakes" — dividing by $N!$ *and* still summing every particle over every state
independently, rather than tracking occupation numbers exactly — cancel to excellent
approximation whenever states vastly outnumber particles, which is the regime this whole
calculation assumed from the start.

## When classical statistics is (and isn't) valid

That last caveat can be made quantitative. Quantum mechanically, a particle is not a point
but a wave packet of width set by its thermal de Broglie wavelength,
$\lambda \sim h/p_{\rm rms}$, with $p_{\rm rms}\sim\sqrt{mk_BT}$ from equipartition.
Treating particles as distinguishable, classical points is only sensible if the mean
interparticle spacing $r_s=(V/N)^{1/3}$ is much *larger* than this spread — otherwise
wave packets overlap and "which particle is which" stops being a meaningful question:

$$
n\lambda^3 \ll 1, \qquad n \equiv N/V,
$$

the **degeneracy parameter**. For nitrogen at room temperature and pressure this comes out
around $10^{-7}$ — deep in the classical regime, which is exactly why the ideal-gas
derivation above works so well for ordinary air. The same estimate flips the other way for
electrons in a metal, for matter in a neutron star, and for helium approaching absolute
zero — systems where $n\lambda^3 \sim 1$ or larger, and classical (Maxwell–Boltzmann)
statistics breaks down entirely.

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


eps = np.linspace(0.001, 8, 400)
KT_CASES = [0.5, 1.0, 2.0]


def maxwell_energy_pdf(eps, kT):
    unnorm = np.sqrt(eps) * np.exp(-eps / kT)
    norm = np.trapezoid(unnorm, eps)
    return unnorm / norm


def fig_maxwell_energy():
    fig = go.Figure()
    p0 = maxwell_energy_pdf(eps, KT_CASES[0])
    fig.add_trace(go.Scatter(x=eps, y=p0, mode="lines", fill="tozeroy",
                              line=dict(color="steelblue", width=2.5),
                              name="P(ε) ∝ ρ(ε) e^(−ε/kT)"))
    fig.add_vline(x=KT_CASES[0] / 2, line=dict(color="firebrick", dash="dot"),
                  annotation_text="peak at ε = kT/2")

    frames = []
    for k, kT in enumerate(KT_CASES):
        p = maxwell_energy_pdf(eps, kT)
        frames.append(go.Frame(data=[go.Scatter(x=eps, y=p)], traces=[0], name=f"{k}",
                                layout=dict(title=f"kT = {kT}  (rising ρ(ε)∝√ε times falling Boltzmann factor)")))
    fig.frames = frames

    fig.update_xaxes(title_text="energy ε")
    fig.update_yaxes(title_text="P(ε)", range=[0, 0.9])
    fig.update_layout(
        title=f"kT = {KT_CASES[0]}  (rising ρ(ε)∝√ε times falling Boltzmann factor)",
        width=700, height=460,
        updatemenus=[dict(type="buttons", showactive=False, y=1.2, x=1.0, xanchor="right",
            buttons=[dict(label="▶ Raise T", method="animate",
                          args=[None, dict(frame=dict(duration=1400, redraw=True),
                                            fromcurrent=True, transition=dict(duration=300))]),
                     dict(label="⏸ Pause", method="animate",
                          args=[[None], dict(mode="immediate")])])],
        sliders=[dict(active=0, x=0.08, len=0.9,
            steps=[dict(method="animate", label=f"kT={kT}", args=[[f"{k}"],
                        dict(mode="immediate", frame=dict(redraw=True))])
                   for k, kT in enumerate(KT_CASES)])],
    )
    return fig


show_fig(fig_maxwell_energy())
```

The single-particle energy distribution $P(\varepsilon)\propto\rho(\varepsilon)\,
e^{-\beta\varepsilon}$ is the product of the rising density of states $\rho(\varepsilon)
\propto\sqrt\varepsilon$ from [Lecture 22–23](lec22_microcanonical_ensemble.md) and the
falling Boltzmann factor — the same peaked-product mechanism used twice already, now
visualized directly. As $T$ rises, the peak (at $\varepsilon=k_BT/2$) shifts outward and
the whole distribution broadens, exactly the classical Maxwell energy distribution
underlying the Maxwell–Boltzmann speed distribution of an ordinary gas.

This is also where Balakrishnan's own lecture pauses: the natural next step is **quantum
statistics** — replacing this particle-by-particle (column-wise) tally with an
occupation-number (row-wise) count of how many particles sit in each state, the change
that produces Bose–Einstein and Fermi–Dirac statistics in place of Maxwell–Boltzmann, and
becomes unavoidable exactly where the degeneracy parameter $n\lambda^3$ stops being small.
