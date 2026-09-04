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

# Lecture 3–4 — Multiple Critical Points, Scaling Arguments, and the Road to Linear Systems

*Source: [NPTEL Classical Physics, Mod-01 Lec-03](https://www.youtube.com/watch?v=0Zo93VDyacE&list=PL5E4E56893588CBA8&index=3)
(Dynamics in phase space) and
[Mod-01 Lec-04](https://www.youtube.com/watch?v=ucG_Ft36XOo&list=PL5E4E56893588CBA8&index=4)
(Linear dynamical systems), Prof. V. Balakrishnan.*

[Lecture 2](lec02_degrees_of_freedom.md) worked out phase portraits for potentials with a
single critical point: a minimum (the harmonic oscillator's **center**) or a maximum (the
inverted oscillator's **saddle**). These two lectures push the same machinery in two
directions. First, what happens once a potential has *several* critical points at once —
and can the period–amplitude relation be extracted without ever solving the equations of
motion? Second, what happens the moment a conservative force stops being conservative —
adding friction is the simplest possible motivation for the general linear-systems
machinery [Lecture 5–6](lec05_autonomous_dynamics.md) develops in full.

## Two critical points in one potential

Take a potential with both a minimum and a maximum,

$$
V(x) = \tfrac12 x^2 + \tfrac13 x^3,
$$

the simplest polynomial that can do it: quadratic near the bottom, with an odd term added
so the two sides aren't mirror images. Setting $V'(x) = x + x^2 = x(1+x) = 0$ gives two
critical points — a **center** at $x=0$ ($V=0$, a genuine minimum since $V''(0)=1>0$) and a
**saddle** at $x=-1$ ($V(-1) = \tfrac12 - \tfrac13 = \tfrac16 \equiv E_s$, since
$V''(-1)=-1<0$). $V$ is monotonically increasing on $(-\infty,-1]$, from $-\infty$ up to
$E_s$, then dips back down to $0$ at $x=0$ before climbing to $+\infty$ as $x\to+\infty$.
That single saddle energy $E_s$ organizes everything that follows:

- **$E < 0$:** the region $x > -1$ is entirely inaccessible ($V \ge 0$ there). The only
  motion is a single unbound branch on $x<-1$: released from rest at the one turning point,
  the particle falls away toward $x\to-\infty$.
- **$0 < E < E_s$:** *two* different kinds of motion coexist at the same energy. One is the
  same kind of unbound branch as above, now with a different turning point on $x<-1$. The
  other is a genuine **periodic orbit**, trapped between two turning points that straddle
  the minimum at $x=0$ — the local analogue of the harmonic oscillator's ellipses.
- **$E = E_s$:** the separatrix. A trajectory released infinitesimally to the right of the
  saddle swings out through the well, reaches a second turning point at $x=\tfrac12$ (where
  $V(\tfrac12)=E_s$ too), and returns — taking infinitely long to leave the saddle and
  infinitely long to get back to it, so it never quite closes. This is a **homoclinic
  orbit**: a single trajectory that leaves an unstable point and asymptotically returns to
  the *same* point.
- **$E > E_s$:** the barrier at $x=-1$ no longer separates anything. A single trajectory
  sweeps in from $x\to-\infty$, crosses over the hump, bounces off the far wall where
  $V(x)=E$ again, and heads back out to $x\to-\infty$.

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import plotly.graph_objects as go
from plotly.subplots import make_subplots
from scipy.optimize import brentq
from scipy.integrate import quad
from scipy.linalg import expm
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


def V(x):
    return 0.5 * x**2 + (1.0 / 3.0) * x**3


X_MIN, X_MAX = -3.2, 1.6
E_S = V(-1.0)  # separatrix energy, at the saddle x = -1

# The full level curve v(x) = +-sqrt(2(E - V(x))) is the entire phase-space
# picture for a conservative 1D system -- no need to integrate an ODE at all.
def branch(E, x):
    v2 = 2.0 * (E - V(x))
    return np.sqrt(np.where(v2 >= 0, v2, np.nan))


x_grid = np.linspace(X_MIN, X_MAX, 900)

CASES = [
    dict(name="E < 0  (single escape branch)", E=-0.2),
    dict(name="0 < E < Eₛ  (bound orbit + a separate escape branch)", E=0.05),
    dict(name="E = Eₛ  (homoclinic separatrix)", E=E_S),
    dict(name="E > Eₛ  (single sweep-through)", E=0.30),
]


def fig_multi_critical():
    fig = make_subplots(rows=1, cols=2, column_widths=[0.4, 0.6],
                         subplot_titles=("Potential V(x)", "Phase portrait (x, v)"))

    fig.add_trace(go.Scatter(x=x_grid, y=V(x_grid), mode="lines",
                              line=dict(color="black", width=2), showlegend=False),
                  row=1, col=1)
    fig.add_trace(go.Scatter(x=[0], y=[0], mode="markers",
                              marker=dict(size=10, color="steelblue"),
                              name="center (min)"), row=1, col=1)
    fig.add_trace(go.Scatter(x=[-1], y=[E_S], mode="markers",
                              marker=dict(size=10, color="firebrick", symbol="x"),
                              name="saddle (max)"), row=1, col=1)
    fig.add_trace(go.Scatter(x=[X_MIN, X_MAX], y=[CASES[0]["E"]] * 2, mode="lines",
                              line=dict(color="firebrick", width=1.5, dash="dot"),
                              name="E"), row=1, col=1)

    for E in [-0.5, -0.3, -0.1, 0.02, 0.08, 0.12, E_S, 0.22, 0.35]:
        v = branch(E, x_grid)
        for sign in (1, -1):
            fig.add_trace(go.Scatter(x=x_grid, y=sign * v, mode="lines",
                                      line=dict(color="rgba(70,130,180,0.25)", width=1),
                                      hoverinfo="skip", showlegend=False), row=1, col=2)
    fig.add_trace(go.Scatter(x=[0], y=[0], mode="markers",
                              marker=dict(size=10, color="steelblue"), showlegend=False),
                  row=1, col=2)
    fig.add_trace(go.Scatter(x=[-1], y=[0], mode="markers",
                              marker=dict(size=10, color="firebrick", symbol="x"),
                              showlegend=False), row=1, col=2)

    v0 = branch(CASES[0]["E"], x_grid)
    fig.add_trace(go.Scatter(x=x_grid, y=v0, mode="lines",
                              line=dict(color="firebrick", width=2.5), name="trajectory"),
                  row=1, col=2)
    fig.add_trace(go.Scatter(x=x_grid, y=-v0, mode="lines",
                              line=dict(color="firebrick", width=2.5), showlegend=False),
                  row=1, col=2)

    n = len(fig.data)
    energy_line_idx, traj_upper_idx, traj_lower_idx = 3, n - 2, n - 1

    frames = []
    for k, c in enumerate(CASES):
        v = branch(c["E"], x_grid)
        frames.append(go.Frame(
            data=[go.Scatter(x=[X_MIN, X_MAX], y=[c["E"]] * 2),
                  go.Scatter(x=x_grid, y=v),
                  go.Scatter(x=x_grid, y=-v)],
            traces=[energy_line_idx, traj_upper_idx, traj_lower_idx],
            name=f"{k}", layout=dict(title=c["name"]),
        ))
    fig.frames = frames

    fig.update_xaxes(title_text="x", range=[X_MIN, X_MAX], row=1, col=1)
    fig.update_yaxes(title_text="V(x)", range=[-1.5, 1.0], row=1, col=1)
    fig.update_xaxes(title_text="x", range=[X_MIN, X_MAX], row=1, col=2)
    fig.update_yaxes(title_text="v", range=[-2.6, 2.6], row=1, col=2)
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


show_fig(fig_multi_critical())
```

The faint background is the full "lamination" of level curves across every energy; the
highlighted curve is whichever case is selected. Two structural facts fall out immediately
once you look at this picture:

- **Trajectories cross the $x$-axis at right angles.** Since $\dot x = v$ and
  $\dot v = -V'(x)/m$, the phase-trajectory slope is
  $dv/dx = -V'(x)/(mv)$, which diverges as $v\to0$ — except exactly at a critical point,
  where $V'(x)=0$ too and the slope is indeterminate. That's why every curve above meets
  $v=0$ vertically, except at $x=0$ and $x=-1$ themselves.
- **Centers and saddles must alternate.** A curve can't have two adjacent minima with no
  maximum between them (there'd be nowhere for it to turn back down), so stable and
  unstable equilibria always interleave along $x$. This is the one-dimensional seed of a
  fact that survives, in a more careful form, all the way into the general classification
  of Lecture 5–6.

## How the period depends on amplitude — a scaling argument

For any potential $V(x) = |x|^r$ ($m=1$), energy conservation fixes the amplitude:
release from rest at $x=a$, and $E = V(a) = a^r$. The quarter-period is a definite
integral,

$$
T = 4\int_0^a \frac{dx}{v(x)} = 4\int_0^a \frac{dx}{\sqrt{2(a^r - x^r)}},
$$

which looks like it depends on $a$ in some complicated way — until you rescale
$x = au$:

$$
T = \frac{4}{\sqrt2}\, a^{\,1-r/2} \int_0^1 \frac{du}{\sqrt{1-u^r}} \;\equiv\; C(r)\, a^{\,1-r/2}.
$$

All of the $a$-dependence factors out front; the remaining integral is a pure number.
**Without solving a single equation of motion**, the amplitude scaling of the period is
fixed by the shape exponent $r$ alone:

- $r=1$ (a bouncing ball under gravity, $V=|x|$): $T \propto a^{1/2}$ — bigger drop, longer
  period, as expected.
- $r=2$ (the harmonic oscillator): $T \propto a^0$ — **isochronous**, independent of
  amplitude. This is the one value of $r$ for which the period doesn't care how far you
  pull it back, and it is the reason a pendulum clock keeps time regardless of how it was
  wound.
- $r=4$ (a quartic well): $T \propto a^{-1/2}$ — **larger** amplitude means a **shorter**
  period. Counterintuitive at first, but the restoring force $\propto x^3$ grows so much
  faster at large $|x|$ that the particle is whipped through the origin faster than it
  loses from having farther to travel.

```{code-cell} ipython3
:tags: [hide-input]

def period_prefactor(r):
    integrand = lambda u: 1.0 / np.sqrt(1 - u**r)
    val, _ = quad(integrand, 0, 1, limit=200)
    return 4 * val / np.sqrt(2)


def fig_scaling():
    a_vals = np.geomspace(0.3, 6.0, 40)
    fig = go.Figure()
    for r, color in [(1, "seagreen"), (2, "steelblue"), (4, "firebrick")]:
        C = period_prefactor(r)
        T_vals = C * a_vals**(1 - r / 2)
        slope = 1 - r / 2
        fig.add_trace(go.Scatter(
            x=a_vals, y=T_vals, mode="lines",
            line=dict(color=color, width=2.5),
            name=f"r={r}  (T ∝ a^{slope:g})",
        ))
    fig.update_xaxes(title_text="amplitude a", type="log")
    fig.update_yaxes(title_text="period T", type="log")
    fig.update_layout(
        title="Period-amplitude scaling for V(x) = |x|ʳ, on log-log axes",
        width=680, height=460,
        legend=dict(yanchor="top", y=0.99, xanchor="left", x=0.02),
    )
    return fig


show_fig(fig_scaling())
```

On log-log axes a power law is a straight line, and the three slopes read off exactly as
$1-r/2$: positive for $r=1$, flat for $r=2$, negative for $r=4$. Nothing here required
knowing $x(t)$ in closed form — only the shape of the potential near where the motion
turns around.

## Kepler's third law without solving the orbit

The same trick — called **scaling** or, to mathematicians, **homothety** — settles a much
older question. Take a general power-law central force, $m\ddot r = -k\, r^{n}\hat e_r$
(with $n=-2$ the inverse-square case). Rescale both length and time,
$r = \lambda r'$, $t = \mu t'$, and the equation of motion becomes

$$
\frac{m\lambda}{\mu^2}\,\ddot r' = -k\lambda^n r'^{\,n}\hat e_r
\quad\Longrightarrow\quad
\lambda^{\,1-n} = \mu^2 \times \text{const}.
$$

The physics is unchanged by a relabeling of units, so this says something sharper than
dimensional analysis alone: *if* an orbit exists with mean radius $r_1$ and period $t_1$,
*then* the same force law supports another orbit with radius $r_2$ and period $t_2$
related by $\lambda = r_2/r_1$ and $\mu = t_2/t_1$ obeying exactly that relation. For the
inverse-square law, $n=-2$, so $1-n=3$ and

$$
\left(\frac{r_2}{r_1}\right)^{3} = \left(\frac{t_2}{t_1}\right)^{2},
$$

**Kepler's third law**, $T^2 \propto R^3$ — extracted without ever writing down an ellipse,
using only how the equation of motion responds to a change of units. The same scaling
picks out $n=1$ (a linear restoring force, i.e. the harmonic oscillator in three
dimensions) as the *only* other power law for which the period carries no length
dependence at all — the isochronism found above, from a completely different argument.

## Adding friction: a new kind of equilibrium

Every phase portrait so far has come from a conserved energy $E = \tfrac12 mv^2 + V(x)$,
whose level curves *are* the trajectories. Friction breaks that. Take the damped harmonic
oscillator,

$$
\ddot x + \gamma \dot x + \omega_0^2 x = 0,
$$

and write it the same way every equation in this course eventually gets written — as a
first-order system in phase space, $\dot{\vec x} = L\vec x$ with $\vec x = (x, v)^T$ and

$$
L = \begin{pmatrix} 0 & 1 \\ -\omega_0^2 & -\gamma \end{pmatrix}.
$$

The formal solution is $\vec x(t) = e^{Lt}\vec x(0)$, where the matrix exponential is
*defined* by the same power series as the scalar one,
$e^{Lt} \equiv \sum_{n=0}^\infty L^n t^n / n!$ — a series that converges for *any* finite
matrix, by the identical ratio-test argument that works for ordinary numbers. If $L$ is
diagonalizable, $e^{Lt}$ is diagonal in the eigenbasis with entries $e^{\lambda_i t}$, so
$x(t)$ and $v(t)$ are always linear combinations of $e^{\lambda_1 t}$ and $e^{\lambda_2 t}$;
only when an eigenvalue repeats does a secular factor $t\,e^{\lambda t}$ appear alongside
it. (Diagonalizability itself is guaranteed whenever the *minimal* polynomial of $L$ has no
repeated roots — a weaker and more useful condition than the textbook sufficient case of a
matrix commuting with its Hermitian conjugate, and it's what the Cayley–Hamilton theorem is
really for.)

For this particular $L$, the secular (characteristic) equation is
$\lambda^2 + \gamma\lambda + \omega_0^2 = 0$, so

$$
\lambda_{1,2} = -\frac{\gamma}{2} \pm \sqrt{\frac{\gamma^2}{4} - \omega_0^2}.
$$

- **Underdamped** ($\omega_0 > \gamma/2$): the eigenvalues are a complex-conjugate pair
  with negative real part $-\gamma/2$ — the phase point **spirals into the origin**.
- **Overdamped** ($\omega_0 < \gamma/2$): two distinct negative real eigenvalues — the
  system relaxes to the origin **monotonically**, no oscillation at all.
- **Critically damped** ($\omega_0 = \gamma/2$): the eigenvalues coincide, and the secular
  $t\,e^{\lambda t}$ term makes its first appearance in this course.

```{code-cell} ipython3
:tags: [hide-input]

REGIMES = [
    dict(name="Underdamped   (ω₀ > γ/2)", gamma=0.4),
    dict(name="Critically damped   (ω₀ = γ/2)", gamma=2.0),
    dict(name="Overdamped   (ω₀ < γ/2)", gamma=3.0),
]
OMEGA0 = 1.0
t_vals = np.linspace(0, 15, 200)
angles = np.linspace(0, 2 * np.pi, 6, endpoint=False)


def damped_trajectories(gamma):
    L = np.array([[0.0, 1.0], [-OMEGA0**2, -gamma]])
    return [np.array([expm(L * t) @ (2.0 * np.array([np.cos(a), np.sin(a)])) for t in t_vals])
            for a in angles]


def fig_damped_tour():
    fig = go.Figure()
    fig.add_trace(go.Scatter(x=[0], y=[0], mode="markers",
                              marker=dict(size=9, color="black"), showlegend=False))
    trajs0 = damped_trajectories(REGIMES[0]["gamma"])
    for tr in trajs0:
        fig.add_trace(go.Scatter(x=tr[:, 0], y=tr[:, 1], mode="lines",
                                  line=dict(color="steelblue", width=2), showlegend=False))

    frames = []
    for k, r in enumerate(REGIMES):
        trajs = damped_trajectories(r["gamma"])
        data = [go.Scatter(x=tr[:, 0], y=tr[:, 1]) for tr in trajs]
        frames.append(go.Frame(data=data, traces=list(range(1, 1 + len(angles))),
                                name=f"{k}", layout=dict(title=r["name"])))
    fig.frames = frames

    fig.update_xaxes(title_text="x", range=[-2.5, 2.5])
    fig.update_yaxes(title_text="v", range=[-2.5, 2.5], scaleanchor="x", scaleratio=1)
    fig.update_layout(
        title=REGIMES[0]["name"], width=620, height=520,
        updatemenus=[dict(type="buttons", showactive=False, y=1.2, x=1.0, xanchor="right",
            buttons=[dict(label="▶ Step through regimes", method="animate",
                          args=[None, dict(frame=dict(duration=1400, redraw=True),
                                            fromcurrent=True, transition=dict(duration=300))]),
                     dict(label="⏸ Pause", method="animate",
                          args=[[None], dict(mode="immediate")])])],
        sliders=[dict(active=0, x=0.08, len=0.9,
            steps=[dict(method="animate", label=r["name"].split("  ")[0],
                        args=[[f"{k}"], dict(mode="immediate", frame=dict(redraw=True))])
                   for k, r in enumerate(REGIMES)])],
    )
    return fig


show_fig(fig_damped_tour())
```

None of these three portraits is a center or a saddle — energy is no longer conserved, so
there's no level-curve lamination to fall back on, and the point genuinely converges onto
(or, running time backward, would diverge from) the origin. That's a **third** qualitative
behavior beyond the two Lecture 2 established, and it's exactly the gap Lecture 5–6 closes:
once you stop restricting $L$ to this one damped-oscillator form and ask what *any* $2\times
2$ matrix can produce, spirals and nodes like these turn out to be two more entries in a
complete six-way classification by trace and determinant alone.

## From worked examples to a general framework

Balakrishnan closes Lec-04 by stepping back from mechanics altogether. Any system of
variables evolving continuously in time — positions, populations, concentrations, whatever
they are — that obeys first-order equations $\dot x_i = f_i(x_1,\dots,x_n,t)$ can be made
**autonomous** by the trick of adding one more variable, $x_{n+1}\equiv t$ with
$\dot x_{n+1}=1$; so it costs nothing to only ever consider the autonomous case
$\dot{\vec x} = \vec f(\vec x)$. If $\vec f$ is linear, the whole story above already solves
it via $e^{Lt}$. If it isn't, there is no general guarantee that a closed-form solution
exists at all — and a genuinely important distinction gets drawn here: **solvability is not
integrability**. You can *always* march a nonlinear system forward numerically, one small
time step at a time, no matter how complicated $\vec f$ is; that's solvability, and it's
never in question. What frequently fails is *integrability* — being able to write $x(t)$
down as an explicit formula, so that "where is it in a million years" is a substitution
rather than a million numerical steps. The gap between the two is genuinely dangerous:
errors compound exponentially along a numerically-integrated trajectory, so "just simulate
it" quietly stops working long before any hardware limit is reached.

There's a sharp threshold buried in that gap. Two-dimensional autonomous systems — the
subject of [Lecture 5–6](lec05_autonomous_dynamics.md) — are tame: nothing more exotic than
the six cases already glimpsed above (center, saddle, node, spiral, and the borderline
cases between them) can occur. The moment $n$ reaches 3, that tameness disappears for good:
this is precisely where **chaos** becomes possible, and it turns out to be the generic
case rather than a curiosity. That's the itinerary for what follows: classify $n=2$
completely, then ask what survives — and what doesn't — once $n$ grows beyond it.
