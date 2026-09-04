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

# Lecture 7 — The Lagrangian Formalism: Action, Euler–Lagrange Equations, and the Pendulum

*Source: [NPTEL Classical Physics, Mod-01 Lec-07](https://www.youtube.com/watch?v=sCZ80l6UarM&list=PL5E4E56893588CBA8&index=8)
(Lagrangian formalism), Prof. V. Balakrishnan.*

[Lecture 5–6](lec05_autonomous_dynamics.md) classified what a system's flow can look like
once you already have equations of motion. This lecture backtracks to ask a more basic
question: where do the equations of motion themselves come from? Newton's second law was
handed down by experience, not derived — the Lagrangian formalism supplies the missing
"why," and does it through the same kind of extremal principle that already shows up
everywhere else in physics.

## An extremal principle for dynamics

Static equilibrium is minimized potential energy. Isolated thermal equilibrium is
maximized entropy. Equilibrium at fixed temperature and volume minimizes the Helmholtz
free energy; at fixed temperature and pressure, the Gibbs free energy. In every one of
these *static* problems, the system sits at an extremum of some scalar. The claim behind
the Lagrangian formalism is that motion obeys an extremal principle too — not extremizing
a single number, but extremizing an integral along the entire path taken through time.

For a system with generalized coordinates $q_1,\dots,q_n$, generalized velocities
$\dot q_1,\dots,\dot q_n$, and possibly explicit time dependence, posit a scalar function
$L(q,\dot q,t)$ — the **Lagrangian**. Given a start point $q(t_1)$ and an end point
$q(t_2)$, define the **action**

$$
S[q] = \int_{t_1}^{t_2} L(q,\dot q, t)\, dt.
$$

Of all conceivable paths connecting those two points in $(q,\dot q)$-space, the system
follows the one along which $S$ is *stationary* — extremal, not necessarily a minimum,
though it usually is one for the problems of interest. That's the **principle of least
action**: $\delta S = 0$.

## Deriving the Euler–Lagrange equations

Fix the endpoints $t_1, t_2$ and consider an arbitrary variation $q \to q + \delta q$ that
vanishes at both ends, $\delta q(t_1) = \delta q(t_2) = 0$ — the paths all have to start
and finish at the same two points, so there's no freedom to vary there. Demanding
$\delta S = 0$ gives

$$
0 = \int_{t_1}^{t_2} \delta L \, dt
  = \int_{t_1}^{t_2} \left(\frac{\partial L}{\partial q}\,\delta q
      + \frac{\partial L}{\partial \dot q}\,\delta \dot q \right) dt,
$$

summed implicitly over each independent degree of freedom. Time itself is never varied —
it's the arena the dynamical variables move through, not a dynamical variable — but the
variation and the time derivative *do* commute, $\delta \dot q = \frac{d}{dt}\delta q$,
since shifting the path and differentiating along it are unrelated operations. Integrating
the second term by parts,

$$
0 = \int_{t_1}^{t_2} \left(\frac{\partial L}{\partial q}
      - \frac{d}{dt}\frac{\partial L}{\partial \dot q} \right) \delta q \, dt
  \;+\; \left[\frac{\partial L}{\partial \dot q}\,\delta q \right]_{t_1}^{t_2}.
$$

The boundary term vanishes identically because $\delta q = 0$ at both ends by
construction. What's left has to hold for *arbitrary* $\delta q(t)$ in between, and for
arbitrary $t_1, t_2$ too — the action principle is true for any two points along the
trajectory, so you can slice the interval as finely as you like and apply it locally.
That forces the integrand's bracket to vanish pointwise, giving the **Euler–Lagrange
equations**,

$$
\frac{d}{dt}\frac{\partial L}{\partial \dot q_i} - \frac{\partial L}{\partial q_i} = 0,
\qquad i = 1,\dots,n.
$$

A statement about an entire path — extremize a single number, the action, integrated over
the whole trajectory at once — has turned into a *local*, pointwise differential equation.
That's not a paradox: the system doesn't need to know the future to extremize $S$ globally,
because $t_1$ and $t_2$ were arbitrary all along, so the same stationarity condition holds
between any two nearby instants, and a local differential equation is exactly what
"stationary between every pair of nearby points" means.

## Why only $q$ and $\dot q$?

The derivation assumed $L$ depends on positions and velocities alone, never on
$\ddot q$ or higher. That's not a mathematical necessity — if $L$ contained $\ddot q$,
the same integration-by-parts trick, applied twice, would produce a $+\dfrac{d^2}{dt^2}
\dfrac{\partial L}{\partial \ddot q}$ term in the equations of motion, and in general one
sign-alternating derivative term for every extra order. It's a physical input: the
independent dynamical variables of a mechanical system are exactly the ones you're free to
specify at an instant without reference to the forces acting — position and velocity. Once
those are fixed, acceleration is *determined* (it's what Newton's second law says), so it
can't also be an independent slot in $L$. A few exceptional systems genuinely do need
$\ddot q$, but the overwhelming majority don't, and this course won't need them.

## Recovering Newton's second law

For a conservative system without friction, the Lagrangian that reproduces the known
equations of motion is $L = T - V$, the kinetic energy minus the potential energy — not a
derivation, just the choice that happens to work. For a set of particles with Cartesian
coordinates $q_i$,

$$
L = \sum_i \tfrac12 m_i \dot q_i^2 - V(q_1,\dots,q_n).
$$

Since $V$ carries no velocity dependence, $\partial L/\partial \dot q_i = m_i \dot q_i$,
and the Euler–Lagrange equation collapses to

$$
\frac{d}{dt}\big(m_i \dot q_i\big) = -\frac{\partial V}{\partial q_i} = F_i,
$$

mass times acceleration equals force — Newton's second law, recovered rather than
assumed. $L$ itself is required to be a **scalar** (invariant under coordinate rotations,
and later, under Lorentz transformations too), which is exactly why $T-V$, built from
dot products and a scalar potential, is a sensible guess in the first place.

## Eliminating constraints: the Atwood machine

The real payoff shows up with constrained systems. The textbook approach — Atwood's
machine, two masses $m_1, m_2$ hanging over a frictionless pulley by an inextensible
string — normally requires introducing the string tension as an unknown constraint force,
solving for it, and only then extracting the acceleration. The Lagrangian method skips the
constraint force entirely.

Measure both masses' positions $x_1, x_2$ downward from the pulley, with the potential
zero there, so $V = -m_1 g x_1 - m_2 g x_2$ and

$$
L = \tfrac12 m_1 \dot x_1^2 + \tfrac12 m_2 \dot x_2^2 + m_1 g x_1 + m_2 g x_2.
$$

The string being inextensible means $x_1 + x_2 = \ell$ for constant $\ell$, i.e.
$\dot x_2 = -\dot x_1$. Substitute the constraint directly into $L$ *before* varying,
eliminating $x_2$ in favor of the single independent coordinate $x_1$:

$$
L = \tfrac12(m_1+m_2)\dot x_1^2 + (m_1 - m_2) g x_1 + \text{const},
$$

where the constant $m_2 g \ell$ term is irrelevant — the Euler–Lagrange equations only
ever see derivatives of $L$, so an additive constant changes nothing. (This is the general
statement that **the Lagrangian is not unique**: shifting the zero of potential energy, as
in choosing where $V=0$, never affects the physics, exactly as it doesn't in Newtonian
mechanics. That freedom disappears relativistically, where there's an absolute zero of
energy set by rest mass.) The single Euler–Lagrange equation for $x_1$ gives

$$
(m_1 - m_2)g = (m_1+m_2)\ddot x_1
\quad\Longrightarrow\quad
\ddot x_1 = \frac{m_1 - m_2}{m_1+m_2}\,g,
$$

the familiar Atwood-machine acceleration — reached without ever writing down the tension.
Rather than adding constraint forces to the problem, the Lagrangian method uses the
constraint to *remove* a coordinate, and the equations of motion for whatever coordinates
remain come out automatically consistent with it.

## What the Lagrangian formalism buys you beyond Newton

Eliminating constraint forces is only the most immediate advantage:

- **Constraints** are absorbed by reducing to independent coordinates, rather than needing
  to be modeled as forces (normal reactions, tensions, and the like).
- **Special relativity**: the formalism generalizes to the relativistic regime, where
  Newton's equations no longer hold, essentially by requiring $L$ to be a Lorentz scalar
  rather than merely a rotational one.
- **Fields**: it extends to systems with a *continuous* number of degrees of freedom.
  Maxwell's equations for the electromagnetic field don't resemble Newton's equations at
  all, but they do emerge as Euler–Lagrange equations from a suitable field Lagrangian —
  the same unifying machinery covers particles and fields.

The chief disadvantage is that the formalism isn't the easiest starting point for
quantization — that's what motivates shifting to the **Hamiltonian** formalism later,
which trades the Euler–Lagrange equations' second-order-in-time structure (there's a
$\ddot{}$ hiding inside $\frac{d}{dt}\partial L/\partial \dot q$) for genuinely first-order
dynamics, at the cost of doubling the number of variables from $q$'s alone to $q$'s and
their conjugate momenta.

## Worked example: the simple pendulum

A massless rigid rod of length $\ell$ carries a bob of mass $m$, swinging frictionlessly
in a vertical plane with angular displacement $\theta$ measured from the bottom. The bob's
speed is $\ell\dot\theta$, and taking the potential zero at the lowest point,

$$
T = \tfrac12 m\ell^2\dot\theta^2, \qquad V = mg\ell(1-\cos\theta),
\qquad L = \tfrac12 m\ell^2\dot\theta^2 - mg\ell(1-\cos\theta).
$$

The single Euler–Lagrange equation, $\frac{d}{dt}\frac{\partial L}{\partial \dot\theta} =
\frac{\partial L}{\partial \theta}$, gives $m\ell^2\ddot\theta = -mg\ell\sin\theta$, i.e.

$$
\ddot\theta = -\frac{g}{\ell}\sin\theta.
$$

This is the *exact* pendulum equation — genuinely nonlinear, since $\sin\theta$ carries
every odd power of $\theta$. It reduces to simple harmonic motion, $\ddot\theta \approx
-\frac{g}{\ell}\theta$ with $\omega_0 = \sqrt{g/\ell}$ and period $2\pi\sqrt{\ell/g}$, only
in the small-angle limit $\sin\theta \approx \theta$. There is no universal cutoff angle
("5.5 degrees," as some textbooks assert) below which this approximation is simply "valid"
— how small $\theta$ needs to be depends entirely on what accuracy you're willing to
accept, since the size of the error is set by the first neglected term, $\theta^3/6$,
relative to $\theta$ itself. Only at $\theta \equiv 0$ are the linear and nonlinear
equations exactly equal.

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import plotly.graph_objects as go
from plotly.subplots import make_subplots
from scipy.special import ellipk
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


def V(theta):
    return 1.0 - np.cos(theta)


THETA_MIN, THETA_MAX = -2 * np.pi, 2 * np.pi
E_S = 2.0  # separatrix energy, at the saddles theta = +-pi, +-3pi, ... (units: m=g=l=1)


def branch(E, theta):
    v2 = 2.0 * (E - V(theta))
    return np.sqrt(np.where(v2 >= 0, v2, np.nan))


theta_grid = np.linspace(THETA_MIN, THETA_MAX, 900)

CASES = [
    dict(name="E < Eₛ  (oscillatory — bound in one well)", E=0.6),
    dict(name="E = Eₛ  (separatrix — heteroclinic connection)", E=E_S),
    dict(name="E > Eₛ  (rotational — full loop-the-loop)", E=3.0),
]


def fig_pendulum_portrait():
    fig = make_subplots(rows=1, cols=2, column_widths=[0.4, 0.6],
                         subplot_titles=("Potential V(θ) = mgl(1-cosθ)", "Phase portrait (θ, θ̇)"))

    fig.add_trace(go.Scatter(x=theta_grid, y=V(theta_grid), mode="lines",
                              line=dict(color="black", width=2), showlegend=False),
                  row=1, col=1)
    centers = [-2 * np.pi, 0, 2 * np.pi]
    fig.add_trace(go.Scatter(x=centers, y=[0, 0, 0], mode="markers",
                              marker=dict(size=10, color="steelblue"),
                              name="center (stable, θ = 2nπ)"), row=1, col=1)
    saddles = [-np.pi, np.pi]
    fig.add_trace(go.Scatter(x=saddles, y=[E_S, E_S], mode="markers",
                              marker=dict(size=10, color="firebrick", symbol="x"),
                              name="saddle (unstable, θ = (2n+1)π)"), row=1, col=1)
    fig.add_trace(go.Scatter(x=[THETA_MIN, THETA_MAX], y=[CASES[0]["E"]] * 2, mode="lines",
                              line=dict(color="firebrick", width=1.5, dash="dot"),
                              name="E"), row=1, col=1)

    for E in [0.15, 0.4, 0.8, 1.2, 1.6, E_S, 2.4, 2.8, 3.4]:
        v = branch(E, theta_grid)
        for sign in (1, -1):
            fig.add_trace(go.Scatter(x=theta_grid, y=sign * v, mode="lines",
                                      line=dict(color="rgba(70,130,180,0.25)", width=1),
                                      hoverinfo="skip", showlegend=False), row=1, col=2)
    fig.add_trace(go.Scatter(x=centers, y=[0, 0, 0], mode="markers",
                              marker=dict(size=10, color="steelblue"), showlegend=False),
                  row=1, col=2)
    fig.add_trace(go.Scatter(x=saddles, y=[0, 0], mode="markers",
                              marker=dict(size=10, color="firebrick", symbol="x"),
                              showlegend=False), row=1, col=2)

    v0 = branch(CASES[0]["E"], theta_grid)
    fig.add_trace(go.Scatter(x=theta_grid, y=v0, mode="lines",
                              line=dict(color="firebrick", width=2.5), name="trajectory"),
                  row=1, col=2)
    fig.add_trace(go.Scatter(x=theta_grid, y=-v0, mode="lines",
                              line=dict(color="firebrick", width=2.5), showlegend=False),
                  row=1, col=2)

    n = len(fig.data)
    energy_line_idx, traj_upper_idx, traj_lower_idx = 3, n - 2, n - 1

    frames = []
    for k, c in enumerate(CASES):
        v = branch(c["E"], theta_grid)
        frames.append(go.Frame(
            data=[go.Scatter(x=[THETA_MIN, THETA_MAX], y=[c["E"]] * 2),
                  go.Scatter(x=theta_grid, y=v),
                  go.Scatter(x=theta_grid, y=-v)],
            traces=[energy_line_idx, traj_upper_idx, traj_lower_idx],
            name=f"{k}", layout=dict(title=c["name"]),
        ))
    fig.frames = frames

    fig.update_xaxes(title_text="θ", range=[THETA_MIN, THETA_MAX], row=1, col=1)
    fig.update_yaxes(title_text="V(θ)", range=[-0.3, 3.6], row=1, col=1)
    fig.update_xaxes(title_text="θ", range=[THETA_MIN, THETA_MAX], row=1, col=2)
    fig.update_yaxes(title_text="θ̇", range=[-2.6, 2.6], row=1, col=2)
    fig.update_layout(
        title=CASES[0]["name"], width=920, height=440,
        updatemenus=[dict(type="buttons", showactive=False, y=1.25, x=1.0, xanchor="right",
            buttons=[dict(label="▶ Step through cases", method="animate",
                          args=[None, dict(frame=dict(duration=1400, redraw=True),
                                            fromcurrent=True, transition=dict(duration=300))]),
                     dict(label="⏸ Pause", method="animate",
                          args=[[None], dict(mode="immediate")])])],
        sliders=[dict(active=0, x=0.08, len=0.9,
            steps=[dict(method="animate", label=c["name"].split("  ")[0],
                        args=[[f"{k}"], dict(mode="immediate", frame=dict(redraw=True))])
                   for k, c in enumerate(CASES)])],
    )
    return fig


show_fig(fig_pendulum_portrait())
```

Because the rod (not a string) can swing all the way around, the phase portrait covers
both bounded oscillation and full rotation. The equilibria alternate exactly as
[Lecture 3–4](lec03_dynamics.md) argued they must: **centers** (stable) at every even
multiple of $\pi$, sitting at the bottom of the potential, and **saddles** (unstable) at
every odd multiple, at the top. The saddle energy $E_s = 2mg\ell$ organizes everything:

- **$E < E_s$:** closed orbits trapped in a single well — ordinary back-and-forth
  oscillation, harmonic only in the small-amplitude limit.
- **$E = E_s$:** the separatrix. Released infinitesimally away from a saddle, the
  pendulum swings out, climbs asymptotically toward the *next* saddle, and never quite
  arrives — technically a **heteroclinic** connection rather than homoclinic, since $-\pi$
  and $\pi$ are physically the same point but distinct on this unrolled $\theta$ axis.
- **$E > E_s$:** the barrier no longer separates anything, and the trajectory becomes an
  open, unbounded curve — the pendulum has enough energy to loop over the top and rotates
  continuously rather than oscillating, trading potential for kinetic energy each time it
  passes back through the bottom.

## The period diverges at the separatrix

Approaching the separatrix from below, the amplitude grows toward $\pi$ and the pendulum
spends longer and longer *crawling* past the top before turning back — in the limit,
infinitely long, since it's asymptotically approaching an equilibrium point it can never
actually reach in finite time. The quarter-period integral,

$$
T = 4\int_0^{\theta_0} \frac{d\theta}{\dot\theta}, \qquad
\tfrac12 \dot\theta^2 = \frac{g}{\ell}(\cos\theta - \cos\theta_0),
$$

is a complete elliptic integral of the first kind, $T = 4\sqrt{\ell/g}\;
K\!\big(\sin^2\tfrac{\theta_0}{2}\big)$, which is finite for every $\theta_0 < \pi$ but
diverges logarithmically as $\theta_0 \to \pi$:

```{code-cell} ipython3
:tags: [hide-input]

def period(theta0):
    m = np.sin(theta0 / 2.0) ** 2
    return 4.0 * ellipk(m)


def fig_period_divergence():
    theta0 = np.linspace(0.02, np.pi * 0.9995, 300)
    T = period(theta0)
    T_small = 2 * np.pi  # small-angle period, in units where sqrt(l/g) = 1

    fig = go.Figure()
    fig.add_trace(go.Scatter(x=theta0 / np.pi, y=T / T_small, mode="lines",
                              line=dict(color="steelblue", width=2.5),
                              name="T(θ₀) / T_small"))
    fig.add_hline(y=1.0, line=dict(color="gray", dash="dot"),
                  annotation_text="small-angle limit T = 2π√(l/g)")
    fig.update_xaxes(title_text="amplitude θ₀ / π  (1 = separatrix)")
    fig.update_yaxes(title_text="T(θ₀) / T_small", type="log")
    fig.update_layout(title="Pendulum period diverges as θ₀ → π (log scale)",
                       width=680, height=460)
    return fig


show_fig(fig_period_divergence())
```

At $10\%$ of the way to the separatrix the period is still within a percent of the
small-angle value; by $99.9\%$ of the way there it has grown past five times that value,
and it keeps climbing without bound. The exact solution $\theta(t)$ isn't expressible in
elementary functions once the amplitude leaves the small-angle regime — it's an elliptic
function — but exactly *at* the separatrix ($E = E_s$) a closed form reappears, related to
the soliton solution of the sine-Gordon equation, a nonlinear wave equation that recurs
throughout physics far beyond this one pendulum.

## Where this is headed

The Lagrangian formalism answers "why Newton's equations" by subsuming them into a single
extremal principle, general enough to survive the move to special relativity and to
continuous fields — generalizations Newton's $F=ma$ has no way to make. What it doesn't
immediately hand you is first-order dynamics: the Euler–Lagrange equations are second
order in time, the same complication [Lecture 5–6](lec05_autonomous_dynamics.md) sidesteps
by working directly in $(q,\dot q)$ phase space. Recasting the same physics with momenta
instead of velocities as independent variables — trading $n$ second-order equations for
$2n$ first-order ones — is exactly the move the Hamiltonian formalism makes next.
