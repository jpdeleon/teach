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

# Lecture 5–6 — Autonomous Dynamical Systems: Linearization, Classification, and Conservative Flows

*Source: [NPTEL Classical Physics, Mod-01 Lec-05](https://www.youtube.com/watch?v=Vmj54LvrLOA&list=PL5E4E56893588CBA8&index=6) (Autonomous dynamical systems, Part 1) and
[Lec-06](https://www.youtube.com/watch?v=oreXK3P6k30&list=PL5E4E56893588CBA8&index=7) (Part 2), Prof. V. Balakrishnan.*

## Local solvability is (almost) automatic

Write a general $N$-dimensional autonomous system as $\dot{\vec x} = \vec f(\vec x)$,
where $\vec x = (x_1,\dots,x_N)$ is a point in phase space and $\vec f$ is a vector
field — at every point it hands you the phase-space *velocity* of the representative
point sitting there. Chain enough of these infinitesimal velocity arrows together and
you get a phase trajectory. Solving this exactly is, in general, hard: $\vec f$ can mix
all $N$ variables in an arbitrarily complicated, nonlinear way.

Locally, though, it's easy. Taylor-expand $\vec f$ about any ordinary point $\vec x_0$
and keep only the leading term:

$$
\dot{\vec x} \approx \vec f(\vec x_0) + O(\vec x - \vec x_0).
$$

Sufficiently close to $\vec x_0$, $\vec f(\vec x_0)$ is just a constant vector, and
$\dot{\vec x} = \text{const}$ integrates trivially: $\vec x(t) \approx \vec x_0 +
\vec f(\vec x_0)\,t$. Do this at the new point you've reached, then the next, and you
can march the solution forward piecewise, patch by patch. The rigorous statement of
this is the **rectification theorem**: in a small enough neighborhood of *any* ordinary
point, there's a change of variables $\vec x \to \vec y$ in which the flow becomes
dead simple — $\dot y_1 = 1$, $\dot y_2 = \dot y_3 = \cdots = 0$ — i.e. pure uniform
translation along one axis.

This does **not** mean the system is solvable globally. The patch of variables that
rectifies the flow near one point generally stops working a little further along, and
you need a new change of variables for the next patch — and those patches can shrink
to nothing, or simply never stitch together into one global formula. **Local
solvability is not global integrability**; most systems are not globally integrable,
which is precisely why the qualitative, geometric methods of this lecture — not
explicit formulas — are the working tools of nonlinear dynamics.

There is exactly one place the rectification argument breaks down: where $\vec
f(\vec x_0) = \vec 0$. There the leading-order velocity vanishes, the local
"translate at constant velocity" picture is trivial (nothing moves), and you're forced
to the *next* order in the Taylor expansion. A point where the vector field vanishes
is a **critical point** (in mechanics, an equilibrium point) — and, like the position
vector $\vec r$ at the origin, a vector field is genuinely *singular* there: not
because it blows up, but because its direction becomes undefined.

## Linearizing at a critical point

Take a critical point to be the origin without loss of generality (just shift
coordinates), so $\vec f(\vec 0) = \vec 0$. The Taylor expansion now starts at first
order,

$$
\dot x_i \approx \sum_j \frac{\partial f_i}{\partial x_j}\bigg|_{\vec 0} x_j
\qquad\text{i.e.}\qquad \dot{\vec x} \approx L\,\vec x,
$$

where $L$ is the **Jacobian matrix** of $\vec f$ evaluated at the critical point. As
long as $L$ is non-singular (a *simple* critical point — the generic case), the
system near the origin is genuinely **linear**, and linear systems we already know how
to solve:

$$
\vec x(t) = e^{Lt}\,\vec x(0).
$$

Everything about the local flow — whether nearby trajectories are pulled in, pushed
out, or orbit around — is therefore governed entirely by the **eigenvalues of $L$**:
positive real parts mean growth, negative real parts mean decay, and purely imaginary
eigenvalues mean oscillation without either.

## Classifying 2D linear flows: it's all trace and determinant

Restrict to two dimensions, $\dot x = f(x,y)$, $\dot y = g(x,y)$, with a critical
point at the origin, $L = \begin{pmatrix} a & b \\ c & d \end{pmatrix}$. The
characteristic (secular) equation is

$$
\lambda^2 - T\lambda + D = 0, \qquad T \equiv \operatorname{tr} L = a+d,\quad D \equiv \det L = ad-bc,
$$

$$
\lambda_{1,2} = \frac{T \pm \sqrt{T^2 - 4D}}{2}.
$$

The eigenvalues — and therefore the entire qualitative picture near the critical
point — depend on the four numbers $a,b,c,d$ only through these **two** combinations.
That's not an accident: $T$ and $D$ are invariant under any similarity transformation
$L \to SLS^{-1}$ (a linear change of coordinates), and a change of coordinates is
exactly what separates two systems that "look different" on paper but have
identical dynamics. This single fact — that only $T$ and $D$ matter — is what makes a
complete classification of 2D linear flows possible with just six cases, laid out on
the $(T,D)$ plane below the discriminant curve $T^2 = 4D$ (real, distinct eigenvalues)
and above it (complex-conjugate pair):

| Region | Eigenvalues | Name |
|---|---|---|
| $D<0$ | real, opposite sign | **Saddle** (always unstable) |
| $D>0,\ T>0,\ T^2>4D$ | real, both positive | **Unstable node** |
| $D>0,\ T<0,\ T^2>4D$ | real, both negative | **Stable node** |
| $D>0,\ T>0,\ T^2<4D$ | $\lambda\pm i\mu,\ \lambda>0$ | **Unstable spiral (focus)** |
| $D>0,\ T<0,\ T^2<4D$ | $\lambda\pm i\mu,\ \lambda<0$ | **Stable spiral (focus)** |
| $D>0,\ T=0$ | $\pm i\mu$, pure imaginary | **Center** (periodic) |

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
from scipy.linalg import expm
from scipy.integrate import solve_ivp
import plotly.graph_objects as go
from plotly.subplots import make_subplots
from IPython.display import HTML

_plotlyjs_loaded = False


def show_fig(fig):
    """Embed a Plotly figure as self-contained HTML+JS. include_mathjax=False
    avoids Plotly's legacy MathJax v2 loader colliding with Sphinx's MathJax
    v3. plotly.js itself is embedded only the first time this runs on a page,
    so four rich figures don't cost four copies of the library.
    """
    global _plotlyjs_loaded
    html = fig.to_html(full_html=False, include_mathjax=False,
                        include_plotlyjs=not _plotlyjs_loaded,
                        config={"responsive": True})
    _plotlyjs_loaded = True
    return HTML(html)

# Six canonical (T, D) points, each with a companion matrix L = [[0, 1], [-D, T]]
# (trace T, determinant D, by construction) so a single numeric recipe --
# propagate initial conditions via the exact matrix exponential exp(Lt) --
# reproduces every case without hand-derived formulas.
CASES = [
    dict(name="Unstable node",   T=3.0,  D=2.0,  r0=0.05, tmax=2.0,       mode="fwd"),
    dict(name="Saddle",          T=0.0,  D=-1.0, r0=0.8,  tmax=1.2,       mode="sym"),
    dict(name="Stable node",     T=-3.0, D=2.0,  r0=2.5,  tmax=1.0,       mode="fwd"),
    dict(name="Stable spiral",   T=-0.6, D=1.0,  r0=2.5,  tmax=10.0,      mode="fwd"),
    dict(name="Center",          T=0.0,  D=1.0,  r0=1.0,  tmax=2*np.pi,   mode="fwd"),
    dict(name="Unstable spiral", T=0.6,  D=1.0,  r0=0.05, tmax=13.0,      mode="fwd"),
]
N_IC, N_T = 8, 60


def trajectories(case):
    T, D, r0, tmax, mode = case["T"], case["D"], case["r0"], case["tmax"], case["mode"]
    L = np.array([[0.0, 1.0], [-D, T]])
    ts = np.linspace(-tmax, tmax, N_T) if mode == "sym" else np.linspace(0, tmax, N_T)
    angles = np.linspace(0, 2 * np.pi, N_IC, endpoint=False)
    return [np.array([expm(L * t) @ (r0 * np.array([np.cos(a), np.sin(a)])) for t in ts])
            for a in angles]


def fig_td_tour():
    fig = make_subplots(rows=1, cols=2, column_widths=[0.42, 0.58],
                         subplot_titles=("Trace–determinant plane", "Phase portrait near the fixed point"))

    T_bg = np.linspace(-4, 4, 200)
    fig.add_trace(go.Scatter(x=T_bg, y=T_bg**2 / 4, mode="lines", line=dict(color="black", width=1.5),
                              name="T² = 4D", showlegend=False), row=1, col=1)
    fig.add_trace(go.Scatter(x=[-4, 4], y=[0, 0], mode="lines", line=dict(color="gray", width=1, dash="dot"),
                              showlegend=False, hoverinfo="skip"), row=1, col=1)

    c0 = CASES[0]
    fig.add_trace(go.Scatter(x=[c0["T"]], y=[c0["D"]], mode="markers",
                              marker=dict(size=16, color="firebrick", symbol="star"),
                              name="current (T, D)"), row=1, col=1)
    fig.add_trace(go.Scatter(x=[0], y=[0], mode="markers", marker=dict(size=9, color="black"),
                              name="fixed point", showlegend=False), row=1, col=2)

    trajs0 = trajectories(c0)
    for tr in trajs0:
        fig.add_trace(go.Scatter(x=tr[:, 0], y=tr[:, 1], mode="lines",
                                  line=dict(color="steelblue", width=2), showlegend=False), row=1, col=2)

    frames = []
    for k, c in enumerate(CASES):
        trajs = trajectories(c)
        data = [go.Scatter(x=[c["T"]], y=[c["D"]])] + [go.Scatter(x=tr[:, 0], y=tr[:, 1]) for tr in trajs]
        frames.append(go.Frame(data=data, traces=[2] + list(range(4, 4 + N_IC)), name=f"{k}",
                                layout=dict(title=f"{c['name']}   (T={c['T']:.1f}, D={c['D']:.1f})")))
    fig.frames = frames

    fig.update_xaxes(title_text="T = trace L", range=[-4, 4], row=1, col=1)
    fig.update_yaxes(title_text="D = det L", range=[-3, 4], row=1, col=1)
    fig.update_xaxes(title_text="x", range=[-3.5, 3.5], row=1, col=2)
    fig.update_yaxes(title_text="y", range=[-3.5, 3.5], row=1, col=2, scaleanchor="x2", scaleratio=1)

    region_labels = [
        dict(x=2.6, y=3.6, text="unstable<br>node", showarrow=False, font=dict(size=10)),
        dict(x=-2.6, y=3.6, text="stable<br>node", showarrow=False, font=dict(size=10)),
        dict(x=2.7, y=0.35, text="unstable<br>spiral", showarrow=False, font=dict(size=10)),
        dict(x=-2.7, y=0.35, text="stable<br>spiral", showarrow=False, font=dict(size=10)),
        dict(x=0, y=2.2, text="T=0: center", showarrow=False, font=dict(size=10)),
        dict(x=0, y=-2.4, text="D < 0: saddle (always unstable)", showarrow=False, font=dict(size=11)),
    ]
    fig.update_layout(
        title=f"{c0['name']}   (T={c0['T']:.1f}, D={c0['D']:.1f})",
        annotations=list(fig.layout.annotations) + region_labels,
        width=920, height=460,
        updatemenus=[dict(type="buttons", showactive=False, y=1.28, x=1.0, xanchor="right",
            buttons=[dict(label="▶ Tour the plane", method="animate",
                          args=[None, dict(frame=dict(duration=1200, redraw=True),
                                            fromcurrent=True, transition=dict(duration=300))]),
                     dict(label="⏸ Pause", method="animate", args=[[None], dict(mode="immediate")])])],
        sliders=[dict(active=0, x=0.08, len=0.9,
            steps=[dict(method="animate", label=c["name"], args=[[f"{k}"], dict(mode="immediate", frame=dict(redraw=True))])
                   for k, c in enumerate(CASES)])],
    )
    return fig


show_fig(fig_td_tour())
```

Step through the six cases: the **saddle** ($D<0$) is the only region that's
*always* unstable regardless of trace, because one eigenvalue is always positive.
Crossing $T^2=4D$ turns a node into a spiral without changing stability — real
eigenvalues that collide and go complex. And the **center** is an infinitely thin
razor's edge: $T$ must be *exactly* zero, so the slightest damping ($T<0$) or the
slightest anti-damping ($T>0$) instantly turns closed periodic orbits into a spiral.
This is the same fragility Lecture 2 found in the undamped harmonic oscillator, now
seen as a single point balanced on a knife-edge in the $(T,D)$ plane.

What if $L$ doesn't happen to be diagonal — off-axis coupling between $x$ and $y$?
Nothing new happens: **any** invertible $2\times2$ linear transformation is some
combination of a rotation, a dilation, and a shear (four parameters total — one angle,
two scale factors, one shear angle — matching the four free entries of $L$). So a
general saddle, node, or spiral is simply the canonical picture above viewed in
skewed, rotated coordinates: topologically the same object, continuously deformable
into the textbook picture. That's exactly what the companion-matrix trick used to
draw the figure exploits — off-diagonal entries are baked in by construction, and the
trajectories still come out as the standard shapes, just tilted.

## Beyond two dimensions

For an $N\times N$ Jacobian, the eigenvalues again depend only on combinations
invariant under similarity transformations — but for $N>2$ there are more of them
than just "trace and determinant." The right generalization is the set of $N$ power
sums $\operatorname{tr}L,\ \operatorname{tr}L^2,\ \dots,\ \operatorname{tr}L^N$
(equivalent to the coefficients of the characteristic polynomial): each is invariant
under $L \to SLS^{-1}$ because in a basis where $L$ is diagonal, $\operatorname{tr}L^k
= \sum_i \lambda_i^k$ manifestly doesn't care how you got to that basis.

In three dimensions genuinely new geometry becomes possible. A pair of complex
eigenvalues $\lambda \pm i\mu$ with $\lambda<0$, combined with one *positive* real
eigenvalue $\lambda_3>0$, produces a **saddle-focus**: trajectories spiral inward
within a 2D invariant plane while simultaneously being ejected along the third
direction.

```{code-cell} ipython3
:tags: [hide-input]

def fig_saddle_focus():
    lam, mu, kappa = -0.35, 2.0, 0.28
    t = np.linspace(0, 9, 400)
    fig = go.Figure()
    for r0, z0, color in [(1.0, 0.05, "firebrick"), (0.6, -0.05, "steelblue"), (1.3, 0.02, "darkorange")]:
        x = r0 * np.exp(lam * t) * np.cos(mu * t)
        y = r0 * np.exp(lam * t) * np.sin(mu * t)
        z = z0 * np.exp(kappa * t)
        fig.add_trace(go.Scatter3d(x=x, y=y, z=z, mode="lines", line=dict(color=color, width=4), showlegend=False))
    xx, yy = np.meshgrid(np.linspace(-1.3, 1.3, 2), np.linspace(-1.3, 1.3, 2))
    fig.add_trace(go.Surface(x=xx, y=yy, z=np.zeros_like(xx), showscale=False, opacity=0.15,
                              colorscale=[[0, "lightblue"], [1, "lightblue"]]))
    fig.update_layout(title="Saddle-focus in 3D: spiral-in within a plane, escape along the third axis",
                       scene=dict(xaxis_title="x", yaxis_title="y", zaxis_title="z"),
                       width=680, height=520, margin=dict(l=0, r=0, t=40, b=0))
    return fig


show_fig(fig_saddle_focus())
```

Drag the surface around: for small $z$ the picture is an ordinary stable spiral, but
nothing keeps the trajectory pinned to that plane forever. Once nonlinear terms take
over further from the critical point, a trajectory that has spiralled outward along
$z$ can get bent back and re-injected near the plane, spiral in again, escape again,
and repeat — a mechanism known as **homoclinic chaos**, one of the standard routes by
which higher-dimensional flows generate genuinely complex, aperiodic behavior. (It's
a preview, not a destination: the full story needs tools this course builds up to
later.)

That same higher-dimensional richness is also where **sensitive dependence on initial
conditions** becomes unavoidable. Two trajectories that start an arbitrarily small
distance $\epsilon$ apart can separate at a rate governed by the local eigenvalues; if
that separation grows *exponentially* in time, $\epsilon\, e^{\lambda t}$, then no
finite amount of precision in the initial condition buys you more than a
logarithmically short window of reliable prediction — this is the seed of **chaos**,
and it recurs throughout the rest of the course.

## Conservative versus dissipative flows

Take a small volume element in phase space, $\delta V = \delta x_1\,\delta
x_2\cdots\delta x_N$, built from $N$ neighboring trajectories each started an
infinitesimal $\delta x_i$ away from a reference point along axis $i$. Each edge
evolves according to the flow, $\dot{(\delta x_i)} = \sum_j (\partial f_i/\partial
x_j)\,\delta x_j$ to leading order (the same linearization as before, just applied
edge by edge). Differentiate the product using the chain rule and only the "diagonal"
terms survive after each $\delta x_i$ factors back out:

$$
\frac{d(\delta V)}{dt} = \left(\sum_i \frac{\partial f_i}{\partial x_i}\right)\delta V
= (\nabla\!\cdot\!\vec f)\,\delta V.
$$

So the **divergence of the vector field** directly measures the local fractional rate
of change of phase-space volume. This motivates a clean definition: a dynamical
system is **conservative** if $\nabla\!\cdot\!\vec f \equiv 0$ everywhere — phase-space
volume is preserved exactly, flowing the way an *incompressible fluid* does in
ordinary space (the continuity equation $\partial\rho/\partial t + \nabla\!\cdot\!(\rho
\vec v)=0$ with $\rho$ constant forces $\nabla\!\cdot\!\vec v = 0$ — the same equation,
just relabeled). A system with $\nabla\!\cdot\!\vec f < 0$ everywhere is
**dissipative**: phase-space volumes shrink, trajectories are drawn toward
lower-dimensional attracting sets.

Two quick checks confirm the definition does what you'd expect. The undamped harmonic
oscillator, $\dot x = v,\ \dot v = -\omega^2x$, has $\partial \dot x/\partial x +
\partial \dot v/\partial v = 0 + 0 = 0$ — conservative, trivially, matching the
centers of Lecture 2's ellipse-laminated phase portrait. Add linear damping, $\dot v =
-\omega^2 x - \gamma v$, and $\nabla\!\cdot\!\vec f = -\gamma < 0$ identically: every
phase-space volume shrinks as $e^{-\gamma t}$, consistent with every trajectory
spiraling down into the single point at the origin.

## The Lotka–Volterra predator–prey model

Here's an example far from mechanics that shows off the same machinery. Let $x$ be a
rabbit population and $y$ a fox population, large enough to treat as continuous:

$$
\dot x = \alpha x - \beta xy, \qquad \dot y = -\gamma y + \delta xy,
$$

rabbits breed exponentially in isolation ($\alpha x$) but are eaten at a rate
proportional to encounters with foxes ($-\beta xy$); foxes starve without rabbits
($-\gamma y$) but grow by eating them ($\delta xy$). Set all four rate constants to 1
for illustration: $\dot x = x(1-y),\ \dot y = y(x-1)$.

There are exactly two critical points. At the **origin**, linearizing keeps only the
leading terms $\dot x \approx x,\ \dot y \approx -y$ — eigenvalues $+1$ and $-1$, a
**saddle**: extinction is an unstable equilibrium, reachable only along a
knife-edge approach. At $(1,1)$, substituting $x=1+u,\ y=1+v$ and linearizing gives
$\dot u = -v,\ \dot v = u$ — eigenvalues $\pm i$, a **center**: rabbits and foxes
oscillate around a **coexistence point**, out of phase, forever (in this simplified
model with no other limiting effects).

```{code-cell} ipython3
:tags: [hide-input]

def lv_rhs(t, s):
    x, y = s
    return [x - x * y, -y + x * y]


def fig_lotka_volterra():
    fig = make_subplots(rows=1, cols=2, column_widths=[0.5, 0.5],
                         subplot_titles=("Phase portrait (x = rabbits, y = foxes)", "One orbit vs. time"))
    for x0, y0 in [(0.5, 0.5), (0.3, 1.6), (2.2, 0.5), (0.15, 0.9), (1.0, 2.3)]:
        sol = solve_ivp(lv_rhs, [0, 15], [x0, y0], max_step=0.02)
        fig.add_trace(go.Scatter(x=sol.y[0], y=sol.y[1], mode="lines",
                                  line=dict(color="steelblue", width=1.8), showlegend=False), row=1, col=1)
    fig.add_trace(go.Scatter(x=[0], y=[0], mode="markers", marker=dict(size=9, symbol="x", color="black"),
                              name="saddle (extinction)"), row=1, col=1)
    fig.add_trace(go.Scatter(x=[1], y=[1], mode="markers", marker=dict(size=9, color="firebrick"),
                              name="center (coexistence)"), row=1, col=1)

    sol = solve_ivp(lv_rhs, [0, 20], [0.3, 1.6], max_step=0.02)
    fig.add_trace(go.Scatter(x=sol.t, y=sol.y[0], mode="lines", line=dict(color="seagreen", width=2),
                              name="rabbits x(t)"), row=1, col=2)
    fig.add_trace(go.Scatter(x=sol.t, y=sol.y[1], mode="lines", line=dict(color="firebrick", width=2),
                              name="foxes y(t)"), row=1, col=2)

    fig.update_xaxes(title_text="x (rabbits)", range=[-0.3, 3], row=1, col=1)
    fig.update_yaxes(title_text="y (foxes)", range=[-0.3, 3], row=1, col=1)
    fig.update_xaxes(title_text="t", row=1, col=2)
    fig.update_yaxes(title_text="population", row=1, col=2)
    fig.update_layout(width=920, height=440, title="Lotka–Volterra predator–prey model")
    return fig


show_fig(fig_lotka_volterra())
```

Every orbit in the positive quadrant is a closed loop encircling $(1,1)$ — near the
center they're the ellipses linearization predicts, and further out they distort into
the lopsided loops the phase portrait shows, but they never cross (the non-crossing
theorem again) and never spiral in or out. The time series makes the "out of phase"
claim concrete: the fox population peaks visibly *after* the rabbit population does,
each overshoot setting up the next collapse. (The model is a famous piece of applied
math history: Vito Volterra derived it in the 1920s to explain oscillating fish catch
data reported by the biologist Umberto D'Ancona, independently of very similar work by
Alfred Lotka on chemical kinetics.)

## Is Lotka–Volterra conservative? Only on average

Compute the divergence: $\nabla\!\cdot\!\vec f = \partial_x[x(1-y)] +
\partial_y[y(x-1)] = (1-y) + (x-1) = x - y$. That is **not** identically zero, so by
the strict definition above Lotka–Volterra is *not* conservative — phase-space area
genuinely contracts while $y>x$ and expands while $x>y$. But every orbit is periodic,
crossing the line $x=y$ exactly twice per cycle, and the contracting and expanding
episodes are equal and opposite: **averaged over one full period, the net change in
area is exactly zero.**

This can be checked quantitatively rather than just argued qualitatively. The
fractional rate of change of an infinitesimal patch of area is $\det\Phi(t)$, where
$\Phi(t)$ is the *variational* (tangent) matrix satisfying $\dot\Phi = J(\vec
x(t))\,\Phi,\ \Phi(0)=I$, with $J$ the (now time-dependent, since the system is
nonlinear) Jacobian evaluated along the actual trajectory — the direct nonlinear
generalization of $e^{Lt}$ from the linear case above. Integrating this alongside a
representative periodic orbit and comparing against the exact result for the damped
oscillator, $\det\Phi(t) = e^{-\gamma t}$ (constant divergence $-\gamma$ integrates
trivially), makes the contrast explicit:

```{code-cell} ipython3
:tags: [hide-input]

def lv_variational_rhs(t, s):
    x, y, p11, p12, p21, p22 = s
    J11, J12, J21, J22 = 1 - y, -x, y, x - 1
    return [x - x * y, -y + x * y,
            J11 * p11 + J12 * p21, J11 * p12 + J12 * p22,
            J21 * p11 + J22 * p21, J21 * p12 + J22 * p22]


# Locate one period by tracking the return distance to the starting point.
x0, y0 = 1.0, 1.6
sol = solve_ivp(lv_rhs, [0, 12], [x0, y0], max_step=0.005, dense_output=True)
dist = np.hypot(sol.y[0] - x0, sol.y[1] - y0)
mask = sol.t > 1.5
T_period = sol.t[mask][np.argmin(dist[mask])]

solv = solve_ivp(lv_variational_rhs, [0, T_period], [x0, y0, 1, 0, 0, 1], max_step=0.01, dense_output=True)
t_grid = np.linspace(0, T_period, 200)
Y = solv.sol(t_grid)
det_phi = Y[2] * Y[5] - Y[3] * Y[4]  # det(Phi): A(t) / A(0)


def fig_area_ratio():
    gamma = 0.5
    t_lin = np.linspace(0, T_period, 200)
    fig = go.Figure()
    fig.add_trace(go.Scatter(x=t_lin, y=np.exp(-gamma * t_lin), mode="lines", line=dict(color="firebrick", width=3),
                              name="damped oscillator: exp(−γt)  (div f = −γ < 0 everywhere)"))
    fig.add_trace(go.Scatter(x=t_grid, y=det_phi, mode="lines", line=dict(color="steelblue", width=3),
                              name="Lotka–Volterra: det Φ(t)  (div f = x − y, changes sign)"))
    fig.add_vline(x=T_period, line=dict(color="gray", dash="dot"))
    fig.add_annotation(x=T_period, y=1.05, text="one full predator–prey period", showarrow=False)
    fig.update_layout(title="Phase-space area A(t)/A(0): dissipative shrink vs. conservative-on-average",
                       xaxis_title="t", yaxis_title="A(t) / A(0)", width=780, height=460)
    return fig


show_fig(fig_area_ratio())
```

The damped oscillator's curve decays monotonically and never comes back — genuinely
dissipative. The Lotka–Volterra curve dips as low as $\sim\!0.32$ mid-cycle (area
actively contracting while foxes outnumber rabbits) and climbs back above $1$ later,
landing within $0.003\%$ of exactly $1$ at $t=T$, the numerically located period —
confirming "conservative on average" isn't just a verbal argument but an identity a
direct calculation reproduces. (It's not a coincidence: a later change of variables
turns Lotka–Volterra into an honest Hamiltonian system, for which $\nabla\!\cdot\!\vec
f \equiv 0$ exactly, without needing to average over anything — a preview of where
this course is headed.)
