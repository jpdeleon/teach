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

# Lecture 2 — Degrees of Freedom, Newton's Equations, and Phase Space

*Source: [NPTEL Classical Physics, Mod-01 Lec-02](https://www.youtube.com/watch?v=8X1x9RLaaxc&list=PL5E4E56893588CBA8&index=2), Prof. V. Balakrishnan.*

## Counting degrees of freedom

A single particle moving in three-dimensional space needs three independent
coordinates to fix its position, so it has 3 degrees of freedom. $N$ unconstrained
particles therefore have $3N$ degrees of freedom in total. These coordinates need not
be Cartesian — they can be angular, or a mix — so we call them **generalized
coordinates** and write them $q_1, \dots, q_{3N}$, reserving the symbol $q$ precisely
because it carries no commitment to a particular coordinate system.

A **constraint** removes degrees of freedom only if it is an *equality* relating
coordinates (a **holonomic** constraint) — for instance fixing the distance between
two particles, $r_{12} = \text{const}$. An *inequality*, such as confining a particle
to one quadrant of a plane, does not reduce the count at all: it is a **non-holonomic**
constraint, and the particle still has as many degrees of freedom as before, just a
restricted range for them.

This distinction matters because it is tempting, but wrong, to guess the naive formula
for a rigid body by simply subtracting one constraint per pairwise distance held fixed.
For $N$ points with every pairwise distance $r_{ij}$ fixed, there are $3N$ coordinates
and $\binom{N}{2} = N(N-1)/2$ such constraints, so the naive count is

$$
3N - \frac{N(N-1)}{2},
$$

which turns *negative* once $N \gtrsim 6$ — an impossibility. The resolution is that
most of these constraints are redundant: once a handful of them hold the body rigid,
the rest follow automatically. Counting the true number of independent degrees of
freedom two different, independent ways settles it:

- **Way 1.** Three coordinates fix the center of mass $\vec R$. The orientation of a
  body-fixed frame relative to a space-fixed frame then takes exactly three Euler
  angles. Total: $3 + 3 = 6$.
- **Way 2.** Three coordinates fix the center of mass. The rotation axis is a unit
  vector on a sphere, needing two angles (latitude/longitude), and the rotation angle
  about that axis is a third. Total: $3 + 2 + 1 = 6$.

Both routes agree: **a rigid body has exactly 6 independent degrees of freedom, no
matter how many particles it is built from** — 3 translational and 3 orientational.
This is also why a rigid diatomic molecule has 2 rotational degrees of freedom (there
is no moment of inertia about the bond axis) rather than 3.

## Newton's equations need velocities too

Drop a piece of chalk from rest and it falls straight down; give it a little sideways
push and it traces a parabolic (really, elliptical) arc; push harder and it goes into
orbit; harder still and it escapes on a hyperbolic trajectory. The initial *position*
and the *force law* alone did not fix which of these happens — the initial *velocity*
did. Newton's equation,

$$
m\,\ddot q = F(q, \dot q, t),
$$

is second order in time, so the state that must be specified to get a unique future is
the pair $(q, \dot q)$, not $q$ alone. A system with an explicitly time-dependent force
is called **non-autonomous**; without that explicit $t$-dependence, it is
**autonomous** — and it is autonomous systems that occupy most of this course.

Because $q$ and $\dot q$ are independent initial data, the natural arena for dynamics
is not configuration space $\{q\}$ but **phase space** $\{q, \dot q\}$: the space of
positions *and* velocities together.

## Phase trajectories cannot cross themselves

This single geometric fact carries a lot of weight. If a phase trajectory of an
autonomous system crossed itself (or crossed another trajectory), the crossing point
would be a single initial condition from which the future would have two different
continuations — which contradicts the determinism of Newton's equations. Hence:

> For an autonomous system, no phase trajectory can intersect itself, and no two
> distinct phase trajectories can intersect each other. The one loophole is a
> trajectory that closes on itself — which is exactly **periodic motion**.

## Worked example: the harmonic oscillator

For a conservative force $F(q) = -dV/dq$, energy conservation collapses the two
first-order equations $\dot q = v,\ \dot v = -V'(q)/m$ down to a single algebraic curve
in phase space:

$$
E = \tfrac{1}{2}mv^2 + V(q).
$$

For the harmonic oscillator, $V(q) = \tfrac12 m\omega^2 q^2$, so

$$
v^2 + \omega^2 q^2 = \frac{2E}{m},
$$

an **ellipse** for every $E > 0$, traversed clockwise (start at maximum $q$ with
$v=0$; releasing from rest sends it back toward the origin, i.e. $v$ goes negative
first). Larger $E$ gives a larger concentric ellipse, so — in Balakrishnan's phrase —
*the phase plane is laminated by these ellipses*, with the one exceptional trajectory
being the single point at the origin ($E=0$), the equilibrium. The figure below is
exactly this picture, animated: the background shows the lamination, and the marker
traces one representative trajectory in real time.

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import plotly.graph_objects as go
from IPython.display import HTML


def show_fig(fig):
    """Embed a Plotly figure as self-contained HTML+JS (interactive with no
    running kernel needed). include_mathjax=False is essential: Plotly's
    default HTML bundles a legacy MathJax v2 loader that collides with
    Sphinx's MathJax v3 and silently breaks all math typesetting on the page.
    """
    return HTML(fig.to_html(full_html=False, include_mathjax=False))


class PhaseSpaceExplorer:
    """
    Exact phase-space geometry and time evolution for a 1D particle of mass m
    in the potential V(q) = sign * 1/2 * m * omega^2 * q^2.

    sign = +1 -> stable harmonic oscillator (bound orbits, ellipses)
    sign = -1 -> inverted (unstable) oscillator (hyperbolic escape / separatrices)
    """

    def __init__(self, omega=1.0, m=1.0, sign=1):
        self.omega = omega
        self.m = m
        self.sign = sign

    def velocity_branch(self, q, E):
        """v(q) on the constant-energy curve E = 1/2 m v^2 + sign * 1/2 m omega^2 q^2."""
        v2 = (2.0 / self.m) * E - self.sign * self.omega**2 * q**2
        return np.sqrt(np.where(v2 >= 0, v2, np.nan))

    def family_curve(self, E, q_range=4.0, n=400):
        """Both branches (+v and -v) of the constant-energy curve, for a static backdrop."""
        q = np.linspace(-q_range, q_range, n)
        return q, self.velocity_branch(q, E)

    def trajectory(self, E, t, phase=0.0):
        """Exact q(t), v(t) for one initial condition of energy E."""
        omega, m, sign = self.omega, self.m, self.sign
        xi = omega * t + phase
        if sign > 0:  # bound orbit: q = A cos(xi)
            A_q = np.sqrt(2 * E / (m * omega**2))
            A_v = np.sqrt(2 * E / m)
            return A_q * np.cos(xi), -A_v * np.sin(xi)
        if E >= 0:  # unbound: crosses over the top of the barrier
            A_v = np.sqrt(2 * E / m)
            return (A_v / omega) * np.sinh(xi), A_v * np.cosh(xi)
        # E < 0: turns around before reaching the barrier top
        A_v = np.sqrt(-2 * E / m)
        return (A_v / omega) * np.cosh(xi), A_v * np.sinh(xi)


def animated_phase_portrait(explorer, energies, highlight_E, t_values,
                             title, q_range=4.0):
    fig = go.Figure()

    # Static background: the family of constant-energy curves ("lamination")
    for E in energies:
        q, v = explorer.family_curve(E, q_range=q_range)
        fig.add_trace(go.Scatter(
            x=q, y=v, mode="lines",
            line=dict(color="rgba(70,130,180,0.35)", width=1.5),
            name=f"E={E:g}", hoverinfo="skip", showlegend=False,
        ))
        fig.add_trace(go.Scatter(
            x=q, y=-v, mode="lines",
            line=dict(color="rgba(70,130,180,0.35)", width=1.5),
            hoverinfo="skip", showlegend=False,
        ))

    # Highlighted trajectory (full path) for the animated marker
    q_full, v_full = explorer.trajectory(highlight_E, t_values)
    fig.add_trace(go.Scatter(
        x=q_full, y=v_full, mode="lines",
        line=dict(color="firebrick", width=2.5),
        name=f"trajectory, E={highlight_E:g}",
    ))

    # Animated marker: current phase-space point
    fig.add_trace(go.Scatter(
        x=[q_full[0]], y=[v_full[0]], mode="markers",
        marker=dict(color="firebrick", size=12, symbol="circle"),
        name="current state (q, v)",
    ))
    marker_trace_index = len(fig.data) - 1

    frames = []
    for k, t in enumerate(t_values):
        q_t, v_t = explorer.trajectory(highlight_E, t)
        frames.append(go.Frame(
            data=[go.Scatter(x=[q_t], y=[v_t])],
            traces=[marker_trace_index],
            name=f"{k}",
        ))
    fig.frames = frames

    fig.update_layout(
        title=title,
        xaxis_title="position  q",
        yaxis_title="velocity  v = q̇",
        yaxis=dict(scaleanchor="x", scaleratio=1),
        width=680, height=520,
        legend=dict(yanchor="top", y=0.99, xanchor="left", x=0.01),
        updatemenus=[dict(
            type="buttons", showactive=False,
            y=1.12, x=0.0, xanchor="left",
            buttons=[
                dict(label="▶ Play", method="animate",
                     args=[None, dict(frame=dict(duration=40, redraw=True),
                                       fromcurrent=True, transition=dict(duration=0))]),
                dict(label="⏸ Pause", method="animate",
                     args=[[None], dict(frame=dict(duration=0, redraw=False),
                                         mode="immediate")]),
            ],
        )],
        sliders=[dict(
            active=0, x=0.08, len=0.9,
            currentvalue=dict(prefix="t = ", visible=True),
            steps=[dict(method="animate", label=f"{t:.2f}",
                        args=[[f"{k}"], dict(mode="immediate",
                                              frame=dict(duration=0, redraw=True))])
                   for k, t in enumerate(t_values)],
        )],
    )
    return fig
```

```{code-cell} ipython3
sho = PhaseSpaceExplorer(omega=1.0, sign=+1)
t_period = np.linspace(0, 2 * np.pi, 60)  # one full period, omega = 1

fig_sho = animated_phase_portrait(
    sho,
    energies=[0.5, 1.0, 1.5, 2.0, 2.5, 3.0],
    highlight_E=2.0,
    t_values=t_period,
    title="Phase portrait — simple harmonic oscillator (laminated by ellipses)",
)
show_fig(fig_sho)
```

Drag the slider (or hit Play): the point moves clockwise at constant angular rate
$\omega$ regardless of which ellipse it is on — the hallmark of the harmonic
oscillator being **isochronous** (period independent of amplitude, i.e. of energy).
Every other trajectory in the lamination is a scaled copy of this one; none of them
intersect, exactly as the non-crossing theorem requires.

## Worked example: the inverted oscillator

Now flip the sign of the potential, $V(q) = -\tfrac12 m\omega^2 q^2$ — a hilltop at the
origin rather than a well. This is precisely the "complete the phase portrait" exercise
the lecture leaves open, for the three cases $E<0$, $E=0$, $E>0$:

$$
v^2 - \omega^2 q^2 = \frac{2E}{m}.
$$

- **$E > 0$:** $v$ never reaches zero — the particle has enough energy to cross the
  hilltop, so the trajectory runs monotonically from $q=-\infty$ to $q=+\infty$ (or
  back). These are hyperbola branches opening *up/down*.
- **$E = 0$:** $v = \pm\omega q$ — straight lines through the origin, the
  **separatrices**, approached only asymptotically as $t\to\pm\infty$.
- **$E < 0$:** the particle cannot reach the hilltop; $|q|$ is bounded below by
  $\sqrt{2|E|/m}/\omega$, and the particle rolls up, turns around at $v=0$, and rolls
  back. These are hyperbola branches opening *left/right*, confined to one side or the
  other — the region between the two turning points is dynamically forbidden (it would
  require negative kinetic energy).

```{code-cell} ipython3
inverted = PhaseSpaceExplorer(omega=1.0, sign=-1)
t_escape = np.linspace(-2.2, 2.2, 60)  # crossing the hilltop, omega = 1

fig_inv = animated_phase_portrait(
    inverted,
    energies=[-2.0, -1.0, 1.0, 2.0],  # E < 0 (turn back) and E > 0 (cross over)
    highlight_E=1.0,
    t_values=t_escape,
    title="Phase portrait — inverted oscillator (separatrices + escape/return branches)",
    q_range=4.0,
)
# Draw in the E = 0 separatrices explicitly, since E = 0 is excluded from the family above
q_sep = np.linspace(-4, 4, 50)
fig_inv.add_trace(go.Scatter(x=q_sep, y=inverted.omega * q_sep, mode="lines",
                              line=dict(color="black", width=1.5, dash="dash"),
                              name="separatrix, E=0"))
fig_inv.add_trace(go.Scatter(x=q_sep, y=-inverted.omega * q_sep, mode="lines",
                              line=dict(color="black", width=1.5, dash="dash"),
                              hoverinfo="skip", showlegend=False))
show_fig(fig_inv)
```

The highlighted, animated branch has $E=1>0$: the marker sails straight across the
hilltop without pausing, gaining speed as it passes $q=0$ — the mirror image of the
harmonic oscillator's closed, periodic ellipses. Compare it against the $E<0$
branches in the background, which turn around before ever reaching $q=0$, and against
the dashed $E=0$ separatrices they asymptote to. Unlike the harmonic oscillator, there
is no periodic motion anywhere in this portrait except the unstable equilibrium point
at the origin itself.
