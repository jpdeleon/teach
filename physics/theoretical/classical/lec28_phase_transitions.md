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

# Lecture 28–30 — Phase Transitions, Critical Phenomena, and Landau Theory

*Source: [NPTEL Classical Physics, Mod-01 Lec-28](https://www.youtube.com/watch?v=kl0lqRnfUWg&list=PL5E4E56893588CBA8&index=29) (Phase transitions, Part 2),
[Lec-29](https://www.youtube.com/watch?v=MIL7M0GKDOM&list=PL5E4E56893588CBA8&index=35) (Part 3), and
[Lec-30](https://www.youtube.com/watch?v=Wya57SmeN00&list=PL5E4E56893588CBA8&index=38) (Part 4), Prof. V. Balakrishnan.*

*This page jumps ahead in Balakrishnan's syllabus — from the linear dynamics of
[Lecture 5–6](lec05_autonomous_dynamics.md) to a statistical-mechanics topic covered much
later in the course. The intervening material (Lagrangian and Hamiltonian mechanics,
oscillations, and the foundations of equilibrium statistical mechanics) isn't
transcribed here yet; see [Upcoming Topics](index.md) for the roadmap. What follows is
self-contained regardless.*

## Recap: one critical point, and one that never appears

Every simple single-component substance has a $P$–$V$–$T$ surface with a liquid–gas
coexistence line that runs from the triple point up to a **critical point**
$(T_c, P_c)$ and then simply stops. Past that point there is no sharp transition left
to cross: you can walk a substance from gas to liquid along a path that skirts around
the critical point, staying in equilibrium the whole way, and never once feel a
discontinuity. The solid–liquid coexistence line does no such thing — trace it as far
as you like and it never terminates in a critical point.

The reason is symmetry, not energetics. A liquid (like a gas) is **homogeneous and
isotropic**: it looks the same after *any* translation or rotation. A crystalline
solid keeps only a **discrete** subgroup of those symmetries — the space group of its
lattice. Order and symmetry are opposites here: the more ordered the phase, the
*smaller* the group of transformations that leaves it unchanged. Melting a crystal
means breaking a discrete symmetry down to nothing in one abrupt step — there is no
way to interpolate continuously between "has crystalline order" and "doesn't," so the
solid–liquid line cannot fade out at a critical point; it must run on indefinitely (or
end on a physical boundary, or meet another transition line, as at the triple point).
Liquid and gas, by contrast, share *exactly* the same symmetry — both are isotropic
and homogeneous — so nothing forbids the distinction between them from shrinking
continuously to zero, which is precisely what happens at $(T_c, P_c)$.

That single observation — that critical points require a symmetry that survives
unbroken on both sides of the transition — is the seed of everything below.

## The fluid–magnet analogy

To understand *what kind* of universal behavior shows up near a critical point, it
helps to leave fluids behind and look at magnets instead, because the microscopic
model is far simpler and yet, remarkably, produces the same mathematics. The
dictionary between the two systems:

| Fluid | Magnet |
|---|---|
| Pressure $P$ | Magnetic field $H$ |
| Volume $V$ | Magnetization $M$ |
| Temperature $T$ | Temperature $T$ |
| Equation of state $P(V,T)$ | Equation of state $M(H,T)$ |
| Work term $-P\,dV$ | Work term $H\,dM$ (Legendre-conjugate to $M\,dH$) |
| Liquid / gas | Ferromagnet / paramagnet |
| Critical point $(T_c, P_c)$ | Curie point $(T_c, H_c{=}0)$ |

The payoff of building this analogy carefully is that the magnet is the *simplest*
system with a genuine phase transition, so we can push the calculation all the way
through by hand — and every conclusion transfers back to the liquid–gas transition
(and, as it turns out, to a huge variety of unrelated systems) essentially unchanged.

## A minimal paramagnet, and Curie's law

Model a paramagnetic substance as $N$ independent, non-interacting atomic dipole
moments $\mu$, each sitting in an external field $H$ and in thermal contact with a
heat bath at temperature $T$. In the simplest version each dipole can only point
along the field or exactly against it, so its energy is $\epsilon = \mp \mu H$. The
canonical (Boltzmann) weights for these two states immediately give the average
magnetization of the sample:

$$
M = N\mu \tanh\!\left(\frac{\mu H}{k_BT}\right).
$$

This is the **magnetic equation of state**, the direct analogue of $P(V,T)$. It is
manifestly bounded, $|M|\le N\mu$, and grows in a small linear region before
saturating — which immediately kills the naive high-school definition of
susceptibility as $M/H$: that ratio simply drifts to zero as $H\to\infty$ even though
$M$ stays finite. The physically meaningful quantity is the **initial slope**,

$$
\chi_T \equiv \left(\frac{\partial M}{\partial H}\right)_{T,N}\!\!\Bigg|_{H=0},
$$

the *isothermal susceptibility* — exactly analogous to the isothermal compressibility
$\kappa_T = -\tfrac1V(\partial V/\partial P)_T$. Differentiating the equation of state
at $H=0$ gives

$$
\chi_T = \frac{N\mu^2}{k_BT} \qquad \textbf{(Curie's law).}
$$

The susceptibility diverges as $T\to 0$: cool a paramagnet enough and an
infinitesimal field is enough to saturate it completely. (Pierre Curie discovered
this experimentally; he died young, in a Paris street accident, having also been the
first to recognize the deep role symmetry plays in the properties of condensed
matter — the very theme running through this lecture.)

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
from scipy.special import iv
from scipy.optimize import brentq
import plotly.graph_objects as go
from IPython.display import HTML

_plotlyjs_loaded = False


def show_fig(fig):
    """Embed a Plotly figure as self-contained HTML+JS. include_mathjax=False
    is essential: Plotly's default bundle drags in a legacy MathJax v2 loader
    that collides with Sphinx's MathJax v3 and silently breaks math on the
    page. plotly.js itself (~4-5 MB) is embedded only the first time this is
    called on a page; later figures reuse that already-loaded copy so six
    interactive figures don't cost six copies of the library.
    """
    global _plotlyjs_loaded
    html = fig.to_html(full_html=False, include_mathjax=False,
                        include_plotlyjs=not _plotlyjs_loaded,
                        config={"responsive": True})
    _plotlyjs_loaded = True
    return HTML(html)


def root_m0(T_over_Tc, n_scan=2000):
    """Positive branch of the spontaneous magnetization: the nonzero root of
    the Weiss self-consistency equation m = tanh((Tc/T) m). Found by scanning
    for a sign change (robust even though m0 -> 1 exponentially fast as
    T -> 0, which breaks a naive fixed-bracket root find) and refining with
    Brent's method.
    """
    if T_over_Tc >= 1.0:
        return 0.0
    f = lambda m: m - np.tanh(m / T_over_Tc)
    m_grid = np.linspace(1e-6, 1 - 1e-15, n_scan)
    sign_change = np.where(np.diff(np.sign(f(m_grid))) != 0)[0]
    if len(sign_change) == 0:
        return 1.0
    i = sign_change[0]
    return brentq(f, m_grid[i], m_grid[i + 1])

def fig_paramagnet_family():
    h = np.linspace(0, 4, 300)  # mu*H / k_B, in kelvin
    T_values = np.linspace(4.0, 0.3, 50)
    fig = go.Figure()
    fig.add_trace(go.Scatter(x=h, y=np.tanh(h / T_values[0]), mode="lines",
                              line=dict(color="firebrick", width=3), name="M / Nμ"))
    fig.frames = [go.Frame(data=[go.Scatter(x=h, y=np.tanh(h / T))], name=f"{k}")
                  for k, T in enumerate(T_values)]
    fig.update_layout(
        title="Paramagnet equation of state:  M/Nμ = tanh(μH / k_BT)",
        xaxis_title="μH / k_B   (kelvin)", yaxis_title="M / Nμ",
        yaxis=dict(range=[0, 1.05]), width=680, height=480,
        updatemenus=[dict(type="buttons", showactive=False, y=1.15, x=1.0, xanchor="right",
            buttons=[dict(label="▶ Cool down", method="animate",
                          args=[None, dict(frame=dict(duration=80, redraw=True),
                                            fromcurrent=True, transition=dict(duration=0))]),
                     dict(label="⏸ Pause", method="animate",
                          args=[[None], dict(mode="immediate")])])],
        sliders=[dict(active=0, x=0.08, len=0.9,
            currentvalue=dict(prefix="T = ", suffix=" K", visible=True),
            steps=[dict(method="animate", label=f"{T:.2f}",
                        args=[[f"{k}"], dict(mode="immediate", frame=dict(redraw=True))])
                   for k, T in enumerate(T_values)])],
    )
    return fig


show_fig(fig_paramagnet_family())
```

Drag the slider toward $T=0$: the curve's initial slope — the susceptibility —
visibly steepens without bound, exactly as $\chi_T \propto 1/T$ predicts.

## Dimensionality hides in the coefficient

The up/down model is the crudest possible caricature; real dipoles can point in any
direction. Relaxing to three dimensions, the magnetization along $H$ becomes a
solid-angle average weighted by the Boltzmann factor $e^{\beta\mu H\cos\theta}$, which
evaluates to the **Langevin function**:

$$
\frac{M}{N\mu} = \coth x - \frac1x \equiv L(x), \qquad x = \frac{\mu H}{k_BT}.
$$

Expanding $L(x)$ for small $x$ gives $L(x)\approx x/3$, so $\chi_T = N\mu^2/(3k_BT)$ —
Curie's law again, but now with a $\tfrac13$ where the 1D model had a bare $1$.
Restricting the dipole to a *plane* instead (a 2D model) replaces the solid-angle
measure $\sin\theta\,d\theta$ with a bare $d\theta$, and the integral no longer closes
in elementary functions — it becomes a ratio of modified Bessel functions,
$I_1(x)/I_0(x)$, whose small-$x$ slope is $\tfrac12$.

Three different models, three different numbers — $1$, $\tfrac12$, $\tfrac13$ — but
they're not independent facts to memorize. Each is exactly $1/(\text{number of
components the dipole is free to explore})$: it traces back to a $\cos^2\theta$
average that comes out to $1$, $\tfrac12$, or $\tfrac13$ depending on whether $\theta$
ranges over a line, a plane, or a sphere. **This is the first hint that critical
behavior depends on the dimensionality of the space the order parameter lives in** —
a theme that becomes central once critical exponents enter the picture.

```{code-cell} ipython3
:tags: [hide-input]

def fig_dimensionality():
    x = np.linspace(0.001, 6, 400)
    fig = go.Figure()
    fig.add_trace(go.Scatter(x=x, y=np.tanh(x), line=dict(color="firebrick"),
                              name="1D (up/down):  tanh x  — slope 1"))
    fig.add_trace(go.Scatter(x=x, y=iv(1, x) / iv(0, x), line=dict(color="darkorange"),
                              name="2D (planar):  I₁(x)/I₀(x)  — slope 1/2"))
    fig.add_trace(go.Scatter(x=x, y=1 / np.tanh(x) - 1 / x, line=dict(color="steelblue"),
                              name="3D (isotropic, Langevin L(x))  — slope 1/3"))
    fig.update_layout(
        title="Same Curie law, different coefficient: dimensionality sets the initial slope",
        xaxis_title="x = μH / k_BT", yaxis_title="⟨cos θ⟩ = M / Nμ",
        width=680, height=480, legend=dict(x=0.32, y=0.12),
    )
    return fig


show_fig(fig_dimensionality())
```

## Turning on interactions: the Weiss molecular field

Curie's law diverges only at $T=0$ — but real ferromagnets order at a finite Curie
temperature. Something is missing: the dipoles have been treated as completely
independent, with no interaction between them at all. The natural culprit, classical
dipole–dipole coupling, actually makes things *worse*: two bar magnets side by side
prefer to align **anti**-parallel (it lowers their mutual energy), so a chain of
purely classical dipoles would settle into an alternating up-down-up-down pattern
with zero net magnetization — no permanent magnet at all. Real ferromagnetism comes
from the **quantum-mechanical exchange interaction**: short-ranged (it dies off
exponentially with distance) but strong enough between nearest neighbors to overwhelm
the weak, long-ranged ($1/r^3$) classical dipole coupling and force *parallel*
alignment instead.

Rather than solving the full quantum many-body problem, Weiss proposed a
phenomenological fix in exactly the spirit of the Van der Waals correction to the
ideal gas: replace the true internal field seen by each dipole with an **effective
field** that grows with the sample's own magnetization,

$$
H_{\text{eff}} = H + \frac{\lambda}{N}M,
$$

and simply substitute this into the paramagnet's equation of state. The result is
implicit — $M$ now appears on both sides —

$$
M = N\mu \tanh\!\left[\frac{\mu}{k_BT}\Big(H + \frac{\lambda}{N}M\Big)\right],
$$

a transcendental equation with no closed-form solution, but one that can be solved
graphically. Setting $H=0$ and writing $m \equiv M/(N\mu)$, $T_c \equiv \mu^2\lambda/k_B$:

$$
m = \tanh\!\left(\frac{T_c}{T}\,m\right).
$$

$m=0$ is always a root. The question is whether there's a *nonzero* one: draw the
straight line $y=m$ and the curve $y=\tanh\!\big((T_c/T)m\big)$ and look for where
they cross away from the origin. The curve's initial slope at $m=0$ is exactly
$T_c/T$. For $T>T_c$ that slope is less than $1$, so the curve stays under the line
everywhere except at the origin — no other crossing exists. For $T<T_c$ the slope
exceeds $1$, the curve pokes *above* the line near the origin before bending over to
saturate at $\pm1$, and two new crossings appear symmetrically at $\pm m_0(T)$. This
is a **pitchfork bifurcation**: one stable equilibrium ($m=0$) splitting into two
stable equilibria ($\pm m_0$) plus an unstable one ($m=0$ itself, now a local
maximum of the free energy) as $T$ drops through $T_c$.

```{code-cell} ipython3
:tags: [hide-input]

def fig_weiss_selfconsistency():
    m = np.linspace(-1.3, 1.3, 300)
    T_values = np.linspace(2.5, 0.12, 60)
    fig = go.Figure()
    fig.add_trace(go.Scatter(x=m, y=m, mode="lines", name="y = m",
                              line=dict(color="black", dash="dot")))
    T0 = T_values[0]
    fig.add_trace(go.Scatter(x=m, y=np.tanh(m / T0), mode="lines",
                              line=dict(color="firebrick", width=3), name="y = tanh((Tc/T) m)"))
    fig.add_trace(go.Scatter(x=[0.0], y=[0.0], mode="markers",
                              marker=dict(size=11, color="firebrick"), name="equilibrium roots"))

    frames = []
    for k, T in enumerate(T_values):
        m0 = root_m0(T)
        roots = [0.0] if m0 == 0 else [0.0, m0, -m0]
        frames.append(go.Frame(data=[
            go.Scatter(x=m, y=m),
            go.Scatter(x=m, y=np.tanh(m / T)),
            go.Scatter(x=roots, y=roots),
        ], name=f"{k}"))
    fig.frames = frames

    fig.update_layout(
        title="Graphical solution of m = tanh((Tc/T) m): roots bifurcate at T = Tc",
        xaxis_title="m", yaxis_title="y",
        xaxis=dict(range=[-1.3, 1.3]),
        yaxis=dict(range=[-1.3, 1.3], scaleanchor="x", scaleratio=1),
        width=680, height=560,
        updatemenus=[dict(type="buttons", showactive=False, y=1.1, x=1.0, xanchor="right",
            buttons=[dict(label="▶ Cool through Tc", method="animate",
                          args=[None, dict(frame=dict(duration=90, redraw=True),
                                            fromcurrent=True, transition=dict(duration=0))]),
                     dict(label="⏸ Pause", method="animate",
                          args=[[None], dict(mode="immediate")])])],
        sliders=[dict(active=0, x=0.08, len=0.9,
            currentvalue=dict(prefix="T / Tc = ", visible=True),
            steps=[dict(method="animate", label=f"{T:.2f}",
                        args=[[f"{k}"], dict(mode="immediate", frame=dict(redraw=True))])
                   for k, T in enumerate(T_values)])],
    )
    return fig


show_fig(fig_weiss_selfconsistency())
```

Watch the two off-axis roots peel away from the origin as the temperature slider
crosses $T/T_c = 1$ — that is the onset of **spontaneous magnetization**: a nonzero
$M$ that persists even after the external field is switched off.

## Critical exponents from mean-field theory

Everything about the behavior *near* $T_c$ falls out of expanding $\tanh$ to cubic
order, $\tanh(\xi)\approx \xi - \xi^3/3$, in the self-consistency equation. Writing
$T$ slightly below $T_c$ and keeping $m_0$ small:

$$
m_0 = \frac{T_c}{T}m_0 - \frac13\left(\frac{T_c}{T}\right)^{\!3} m_0^3
\;\;\Longrightarrow\;\;
m_0^2 \approx 3\,\frac{T_c-T}{T_c}.
$$

$$
\boxed{m_0 \propto (T_c - T)^{1/2}} \qquad \text{(critical exponent } \beta = \tfrac12\text{)}
$$

```{code-cell} ipython3
:tags: [hide-input]

def fig_beta_exponent():
    T_values = np.linspace(0.995, 0.05, 250)
    m0_values = np.array([root_m0(T) for T in T_values])
    delta = 1 - T_values
    fig = go.Figure()
    fig.add_trace(go.Scatter(x=delta, y=m0_values, mode="lines", line=dict(color="firebrick", width=3),
                              name="exact m₀(T) from Weiss theory"))
    fig.add_trace(go.Scatter(x=delta, y=np.sqrt(3 * delta), mode="lines",
                              line=dict(color="black", dash="dash"),
                              name="√[3(Tc−T)/Tc]  —  the β=1/2 law"))
    fig.update_layout(
        title="Spontaneous magnetization near Tc:  m₀ ∝ (Tc − T)^(1/2)",
        xaxis_title="(Tc − T) / Tc", yaxis_title="m₀", width=680, height=480,
        legend=dict(x=0.05, y=0.95),
    )
    return fig


show_fig(fig_beta_exponent())
```

The square-root law hugs the exact curve right at the origin and visibly peels away
as $T$ drops further — exactly as expected of a leading-order expansion valid only in
the *immediate* vicinity of $T_c$.

Two companion exponents fall out of the same equation of state:

- **On the critical isotherm** ($T=T_c$ exactly, small field $h=\mu H/k_BT_c$): the
  self-consistency equation becomes $m = \tanh(h+m)$, which to leading nontrivial
  order gives $h \approx m^3/3$ — a **cubic**, not linear, curve through the origin:
  $\boxed{h \propto m^{\delta}}$ with $\delta = 3$.
- **The susceptibility** $\chi_T = (\partial m/\partial h)_{h=0}$ diverges as $T\to
  T_c$ from *either* side, $\boxed{\chi_T \propto |T-T_c|^{-\gamma}}$ with $\gamma=1$
  — the **Curie–Weiss law**, the natural generalization of the bare Curie law now
  divergent at the finite temperature $T_c$ rather than only at absolute zero.

What makes $\beta=\tfrac12$, $\gamma=1$, $\delta=3$ worth remembering by name is that
the *identical* exponents appear at the liquid–gas critical point — a system with a
totally different microscopic mechanism — because the Van der Waals correction term
$-a/V^2$ (an average attraction proportional to the square of the number density) has
exactly the same mathematical structure as the Weiss molecular field $\propto M$.
Both are **mean-field theories**: they replace a genuinely fluctuating, spatially
varying interaction with its *average* effect. Real 3D magnets measured close to
$T_c$ show $\beta\approx\tfrac13$ and $\gamma\approx 1.3$, not the mean-field values —
getting to the asymptotic regime demands controlling temperature to milli-kelvin
precision, among the hardest quantities in physics to pin down that tightly — but the
*qualitative* agreement between two unrelated systems is the discovery: near a
critical point, most microscopic detail becomes irrelevant, and only a few structural
features (here, dimensionality) survive.

## Why the Ferro-up/Ferro-down line is exactly flat

The $H$–$T$ phase diagram has the Curie point sitting on a coexistence line at
$H=0$, $T<T_c$, separating the "Ferro-up" phase from the "Ferro-down" phase — the
direct analogue of the liquid–gas coexistence line in the $P$–$T$ plane. But its
*slope* behaves completely differently, and the reason is worth deriving carefully
because it recycles a single trick — a Maxwell relation dressed up as a
Clausius–Clapeyron equation — across three physically distinct cases.

Starting from $dQ = T\,dS$ along a coexistence curve and a Maxwell relation,

$$
\frac{dP}{dT} = \frac{\Delta S}{\Delta V}, \qquad\qquad \frac{dH}{dT} = \frac{\Delta S}{\Delta M},
$$

with $\Delta$ denoting (final phase) $-$ (initial phase), unambiguous once you fix
which phase is which.

- **Liquid–gas:** the gas is far more disordered, so
  $\Delta S = S_{\text{gas}} - S_{\text{liquid}} > 0$ always; likewise
  $\Delta V = V_{\text{gas}} - V_{\text{liquid}} > 0$ always. Both numerator and
  denominator are positive — but $\Delta V$ is *huge* (a liquid's specific volume
  barely responds to temperature) — so the slope is positive but small: the familiar
  shallow-sloped boiling curve.
- **Solid–liquid:** the liquid is always more disordered than the crystal, so
  $\Delta S = S_{\text{liquid}} - S_{\text{solid}} > 0$ always — but $\Delta V =
  V_{\text{liquid}} - V_{\text{solid}}$ has **no fixed sign**. Most substances
  contract on freezing ($\Delta V>0$, positive steep slope); water is a famous
  exception — its near-icosahedral short-range order freezes into an open crystal
  structure that is *less* dense than the liquid, so $\Delta V<0$ and ice's
  melting curve tilts the other way, which is also why ice floats.
- **Ferro-up / Ferro-down:** flip the field's sign and the entire microstate
  distribution flips with it — every spin configuration with a given excess of "up"
  spins has an exactly degenerate mirror configuration with the same excess of
  "down" spins, of identical energy. So $\Delta S \equiv 0$ **identically**, while
  $\Delta M \ne 0$. The slope $dH/dT = \Delta S/\Delta M$ is therefore exactly zero
  for every $T<T_c$ — not approximately, not just "small like the liquid–gas
  slope," but *exactly* flat, forced by the up–down symmetry of zero field. It is
  also the only sane answer physically: nobody heats a permanent magnet at zero
  field and watches its polarity spontaneously reverse — flipping it requires
  actually crossing the $H=0$ line.

(A related curiosity: despite the huge visual asymmetry between the liquid and gas
branches of the $V$–$T$ diagram — compare the nearly incompressible liquid branch to
the wildly expanding gas branch — an empirical **law of rectilinear diameters** shows
that a simple linear change of variables restores a hidden symmetry, the same
symmetry the magnetic diagram displays outright. The $\beta=\tfrac12$ exponent right
at the tip of the curve is untouched by any of this asymmetry.)

## Generalizing the order parameter

Every example so far has used a quantity that vanishes in the disordered phase and
grows continuously from zero below $T_c$: an **order parameter**. Identifying the
right order parameter is the essential first step for *any* phase transition, and
it isn't always the obvious "extensive quantity that changes":

| Transition | Order parameter | Type |
|---|---|---|
| Para → Ferro magnet | Magnetization $M$ | vector |
| Liquid → Gas | Density difference $\rho_{\text{liquid}} - \rho_{\text{gas}}$ | scalar |
| Liquid → Crystal | Fourier amplitudes of the density, $\tilde\rho(\vec k) = \int \rho(\vec r)\,e^{i\vec k\cdot\vec r}\,d^3r$ | set of Fourier components |
| Normal liquid He → Superfluid He | Condensate wavefunction $\psi(\vec r)$ | complex scalar |

Entropy changes at every one of these transitions too, but entropy is *not* the order
parameter — it doesn't satisfy the right technical requirements. For the
liquid–crystal transition in particular, the ordinary density itself is nearly
useless (liquids and solids have almost the same density), but the density's Fourier
transform is not: it is essentially flat (no preferred direction) for an isotropic
liquid and sharply peaked at the crystal's reciprocal-lattice vectors, uniquely
encoding *which* crystalline order has appeared. For superfluid helium the order
parameter is a genuinely quantum object — a macroscopic condensate wavefunction, zero
above the transition and a coherent nonzero complex amplitude below it, with both its
modulus and its phase carrying physical meaning. Order parameters, in short, can be
scalars, vectors, sets of Fourier amplitudes, or complex numbers — whatever the
symmetry being broken demands.

## Landau's phenomenological theory

Landau's 1937 insight was to stop building microscopic models altogether and instead
ask what the free energy *must* look like as a function of the order parameter,
constrained only by symmetry. Near the critical point the order parameter is small,
so expand the free energy at $H=0$ in powers of $m$:

$$
F(m,T) \approx F_0(T) + c_1 m + a(T)\,m^2 + c_3 m^3 + b(T)\,m^4 + \cdots
$$

At zero field, up and down are physically equivalent — the free energy must be
invariant under $m \to -m$ — which forbids every odd power outright:

$$
F(m,T) - F_0(T) = a(T)\,m^2 + b(T)\,m^4, \qquad b(T) > 0 \text{ (stability)}.
$$

Minimizing, $\partial F/\partial m = 2am + 4bm^3 = 0$, gives $m=0$ always, plus
$m^2 = -a/2b$ whenever $a<0$. So the *shape* of $F(m)$ does all the work:

- $a(T) > 0$: a single well, minimum at $m=0$ — the disordered phase.
- $a(T) < 0$: a double well, degenerate minima at $m = \pm\sqrt{-a/2b}$ — the
  ordered phase, with $m=0$ demoted to an unstable local maximum.

For $a(T)$ to switch sign at $T_c$, the simplest (and generic) choice is a linear
zero-crossing, $a(T) = a_1(T - T_c)$. This single assumption *by itself*, with no
reference to spins or dipoles at all, reproduces $m_0 \propto (T_c-T)^{1/2}$ — because
any smooth, symmetric free energy truncated at quartic order has no other option.
That is the real content of "$\beta = \tfrac12$ is a mean-field exponent": it is a
generic consequence of Taylor-expanding *any* symmetric free energy, not a
coincidence shared by the Weiss and Van der Waals models specifically. (Restoring a
small field adds back the symmetry-breaking linear term $-Hm$, and re-deriving
$\delta=3$ and $\gamma=1$ from this Landau form recovers exactly the exponents found
above — Landau theory doesn't just explain $\beta$, it reproduces the whole mean-field
universality class from symmetry alone.)

```{code-cell} ipython3
:tags: [hide-input]

def fig_landau_free_energy():
    m = np.linspace(-1.4, 1.4, 300)
    t_values = np.linspace(1.0, -1.0, 50)  # proxy for a(T) ~ (T - Tc)/Tc

    def minima(t):
        if t >= 0:
            return [0.0], [0.0]
        m0 = np.sqrt(-t / 2)
        F0 = t * m0**2 + m0**4
        return [m0, -m0], [F0, F0]

    fig = go.Figure()
    fig.add_trace(go.Scatter(x=m, y=t_values[0] * m**2 + m**4, mode="lines",
                              line=dict(color="steelblue", width=3), name="F(m) − F₀"))
    xs, ys = minima(t_values[0])
    fig.add_trace(go.Scatter(x=xs, y=ys, mode="markers",
                              marker=dict(size=10, color="firebrick"), name="minima"))

    frames = []
    for k, t in enumerate(t_values):
        F = t * m**2 + m**4
        xs, ys = minima(t)
        frames.append(go.Frame(data=[go.Scatter(x=m, y=F), go.Scatter(x=xs, y=ys)], name=f"{k}"))
    fig.frames = frames

    fig.update_layout(
        title="Landau free energy F(m) = a(T)·m² + b·m⁴: pitchfork bifurcation at a(T) = 0",
        xaxis_title="order parameter m", yaxis_title="F − F₀  (arbitrary units)",
        width=680, height=480,
        updatemenus=[dict(type="buttons", showactive=False, y=1.15, x=1.0, xanchor="right",
            buttons=[dict(label="▶ Cool through Tc", method="animate",
                          args=[None, dict(frame=dict(duration=90, redraw=True),
                                            fromcurrent=True, transition=dict(duration=0))]),
                     dict(label="⏸ Pause", method="animate",
                          args=[[None], dict(mode="immediate")])])],
        sliders=[dict(active=0, x=0.08, len=0.9,
            currentvalue=dict(prefix="a(T) ∝ (T − Tc)/Tc = ", visible=True),
            steps=[dict(method="animate", label=f"{t:.2f}",
                        args=[[f"{k}"], dict(mode="immediate", frame=dict(redraw=True))])
                   for k, t in enumerate(t_values)])],
    )
    return fig


show_fig(fig_landau_free_energy())
```

## Spontaneous symmetry breaking with a complex order parameter

Superfluid helium's order parameter $\psi$ is complex, not real, so the same
expansion becomes $F(\psi,T) \approx F_0 + a(T)|\psi|^2 + b|\psi|^4$. Below $T_c$ the
minimum is no longer a pair of isolated points but an entire **circle**,
$|\psi| = \sqrt{-a/2b}$, of degenerate minima in the complex plane — the "Mexican
hat" or wine-bottle potential. Moving *around* the circle (changing the phase of
$\psi$) costs no energy at all in this model; only radial motion, toward or away
from the rim, does.

```{code-cell} ipython3
:tags: [hide-input]

def fig_mexican_hat():
    r = np.linspace(0, 1.2, 70)
    theta = np.linspace(0, 2 * np.pi, 70)
    R, Theta = np.meshgrid(r, theta)
    X, Y = R * np.cos(Theta), R * np.sin(Theta)
    Z = -1.0 * R**2 + 1.0 * R**4

    fig = go.Figure(data=[go.Surface(x=X, y=Y, z=Z, colorscale="Blues", showscale=False,
                                       contours=dict(z=dict(show=True, usecolormap=True,
                                                             project_z=True)))])

    r_min = np.sqrt(0.5)
    ring_theta = np.linspace(0, 2 * np.pi, 200)
    z_min = -1.0 * r_min**2 + 1.0 * r_min**4
    fig.add_trace(go.Scatter3d(
        x=r_min * np.cos(ring_theta), y=r_min * np.sin(ring_theta), z=np.full_like(ring_theta, z_min),
        mode="lines", line=dict(color="firebrick", width=6), name="degenerate minima",
    ))
    fig.update_layout(
        title="Complex order parameter below Tc:  F(ψ) = a|ψ|² + b|ψ|⁴,  a < 0",
        scene=dict(xaxis_title="Re ψ", yaxis_title="Im ψ", zaxis_title="F − F₀"),
        width=680, height=560, margin=dict(l=0, r=0, t=40, b=0),
    )
    return fig


show_fig(fig_mexican_hat())
```

Drag the surface around: a ball settled anywhere on the circular trough can slide
*tangentially* along the rim for free but must climb *radially* to leave it. That
asymmetry has real consequences. Whenever a **continuous** symmetry — here, the phase
rotation $\psi \to \psi\,e^{i\phi}$ — breaks spontaneously, the flat tangential
direction guarantees a mode of excitation that costs vanishing energy in the
long-wavelength limit: a **Goldstone mode**. Spin waves in a ferromagnet and acoustic
phonons in a crystal are physical examples — both cost energy that vanishes as the
wavelength goes to infinity. Ordinary ferromagnets don't have this: flipping $m\to
-m$ is a *discrete* symmetry (only two rim points, not a continuous circle), so there
is no free tangential direction and no Goldstone mode — a genuinely different kind of
symmetry breaking from the continuous case.

## First-order transitions, and the limits of mean-field theory

Not every transition grows continuously out of $m=0$. Allow the quartic coefficient
itself to vary — e.g. $F - F_0 = am^2 + bm^4 + cm^6$ with $c>0$ for stability — and as
$b(T)$ sweeps through negative values a *second*, initially higher local minimum can
develop away from $m=0$, become momentarily degenerate with it, and then drop below
it. The order parameter then jumps discontinuously from one minimum to the other
rather than growing smoothly from zero — the generic Landau mechanism for a
**first-order** (discontinuous) transition, always accompanied by a nonzero latent
heat, as opposed to the **second-order** (continuous) mechanism worked out above.

Landau's own motivation was actually structural phase transitions in crystals,
classified via group theory and crystallography — well beyond this course — but the
same free-energy logic carries over. A later refinement by Ginzburg added a
gradient-energy penalty $k(\nabla m)^2$ for spatial variation of the order parameter
(needed because near $T_c$ a magnet doesn't flip uniformly — islands of "up" shrink
while islands of "down" grow), turning this into the **Landau–Ginzburg** theory that
underlies the modern treatment of correlation functions near criticality.

Mean-field theory itself, finally, is only *exact* above an **upper critical
dimension** (typically $d=4$ for these models); below it, the fluctuations mean-field
theory ignores start to matter and shift the exponents away from $\beta=\tfrac12$,
$\gamma=1$, $\delta=3$ toward the experimentally observed values. There is also a
**lower critical dimension** (often $d=2$) below which no ordered phase exists at any
positive temperature at all. We live in $d=3$ — strictly between the two — which is
exactly why real magnets show non-mean-field exponents while still displaying every
qualitative feature derived here: an order parameter, a symmetry that must break, and
a critical point where microscopic detail stops mattering. (Quantum phase
transitions — driven by quantum rather than thermal fluctuations, occurring at
$T=0$ — extend this picture further still, but that is a story for another course.)
