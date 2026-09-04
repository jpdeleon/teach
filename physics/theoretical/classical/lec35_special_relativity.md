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

# Lecture 35–38 — Special Relativity: Noether's Theorem, Four-Vectors, and the Lorentz Group

*Source: [NPTEL Classical Physics, Mod-01 Lec-35](https://www.youtube.com/watch?v=PuSwic2JI5M&list=PL5E4E56893588CBA8&index=36) (Noether's theorem; Special relativity, Part 1),
[Lec-36](https://www.youtube.com/watch?v=e-W_omQ1FyA&list=PL5E4E56893588CBA8&index=37) (Part 2),
[Lec-37](https://www.youtube.com/watch?v=VCM22kuGQmI&list=PL5E4E56893588CBA8&index=38) (Part 3), and
[Lec-38](https://www.youtube.com/watch?v=gCeqTkpMjgk&list=PL5E4E56893588CBA8&index=39) (Part 4), Prof. V. Balakrishnan.*

*A handful of lectures (Lec-31–34, continuing critical phenomena and laying the
group-theory groundwork for Noether's theorem) sit between
[Lecture 28–30](lec28_phase_transitions.md) and this page and aren't transcribed
here yet. This is, however, the **last** lecture of Balakrishnan's course — it ends,
fittingly, by handing off to quantum mechanics.*

## Prelude: symmetry implies conservation

Lec-35 opens with **Noether's theorem**, the precise statement of an idea used
informally all through this course: every continuous symmetry of a Lagrangian hands
you a conserved quantity for free. Make an infinitesimal change of coordinates $q_i
\to q_i + \epsilon f_i(q,t)$ (schematically $\delta q_i$) and compute the resulting
change in the Lagrangian two independent ways. Using the Euler–Lagrange equations
directly,

$$
\Delta L = \frac{\partial L}{\partial q_i}\delta q_i + \frac{\partial L}{\partial \dot q_i}\delta \dot q_i
= \frac{d}{dt}\Big(p_i\,\delta q_i\Big)
$$

(the first term became $\tfrac{d}{dt}p_i\,\delta q_i$ via the equations of motion, and
$\tfrac{d}{dt}\delta q_i = \delta\dot q_i$ since the variation and the time
derivative commute). If, independently — *without* invoking the equations of
motion — the transformation also happens to change $L$ by nothing more than a total
time derivative, $\Delta L = \tfrac{d}{dt}\big(\epsilon f(q,t)\big)$, then the
equations of motion themselves don't change (the action is invariant), and equating
the two expressions gives

$$
\boxed{\; p_i\,\delta q_i - \epsilon f(q,t) = \text{constant of the motion.}\;}
$$

Two familiar examples fall out immediately. Translate every particle by a constant
vector $\vec\epsilon$: a free particle's Lagrangian doesn't change at all
($\Delta L\equiv 0$, so $f=0$), and the theorem hands back $\vec p\cdot\vec\epsilon =
\text{const}$ for arbitrary $\vec\epsilon$ — **linear momentum is conserved because
space is homogeneous.** Rotate the coordinate system instead, by an infinitesimal
angle about axis $\hat n$ ($\delta\vec r = \epsilon\,\hat n\times\vec r$): a central
potential $V(r)$ depends only on $|\vec r|$, so again $\Delta L\equiv 0$, and the
theorem gives $\vec p\cdot(\hat n\times\vec r) = \hat n\cdot(\vec r\times\vec p) =
\text{const}$ for every $\hat n$ — **angular momentum is conserved because space is
isotropic.** (A third case, where $f\ne 0$, appears when the *value* of the constant
of motion depends explicitly on time — dropping an object under gravity, invariant
under $z\to z+\epsilon$ since adding a constant to a potential changes nothing
physical, hands back $p = -mgt + \text{const}$, i.e. exactly the equation for the
initial velocity. The "trivial" translation symmetry, worked through honestly,
re-derives free fall.)

Every symmetry considered so far has been a symmetry of *space alone*, with time
sitting outside, flowing uniformly and absolutely in the background. What happens
once the symmetry mixes space and time together — the way motion itself does?

## The postulate that broke Newton's clock

Newtonian mechanics already assumed a great deal of invariance: translate the
origin, rotate the axes, shift the zero of time, or view everything from a frame
moving at constant velocity, and the laws of motion keep their form. Together these
transformations — 3 translations, 3 rotations, 1 time shift, 3 boosts — form a
ten-parameter group, the **Galilean group**. Newton's one questionable extra
ingredient was to single out a *preferred* set of these frames ("fixed relative to
the distant stars"); the better, coordinate-free definition of an inertial frame is
simply one in which Newton's first law holds — a particle left alone moves in a
straight line at constant speed.

Einstein's insight was to add exactly one further postulate to this list: **there
exists a finite speed, the same in every inertial frame, independent of the motion of
source or observer.** Light in vacuum happens to travel at this fundamental speed
$c$ — a fortunate physical accident that made the postulate discoverable at all — but
the statement itself is purely about spacetime, not about light specifically.

The consequence is derived exactly the way a rotation is derived: by demanding that
some quadratic form stay invariant. Send out a spherical light pulse from a common
origin at $t=t'=0$; in frame $S$ it satisfies $c^2t^2 = r^2$, and by the postulate,
in frame $S'$ moving at velocity $v$ along $x$, the *same* pulse satisfies
$c^2t'^2=r'^2$ with the *same* $c$. Newtonian mechanics could only preserve $c^2t^2 -
r^2 = c^2t'^2-r'^2$ by taking $t=t'$ and $c\to\infty$; relativity preserves it
instead by letting $t$ itself transform. Requiring this quadratic form to be
invariant — exactly as requiring $x^2+y^2+z^2$ to be invariant forces rotations to be
orthogonal matrices — forces the transformation between frames to be the **Lorentz
transformation**:

$$
x' = \gamma(x - vt), \qquad y'=y,\qquad z'=z, \qquad t' = \gamma\Big(t - \frac{vx}{c^2}\Big),
\qquad \gamma \equiv \frac{1}{\sqrt{1-v^2/c^2}}.
$$

## Four-vectors and the geometry of spacetime

Bundle space and time into a single object, the **four-vector** $x^\mu \equiv
(ct,\,x,\,y,\,z)$, $\mu=0,1,2,3$. Anything that transforms the same way under Lorentz
transformations — rotations *and* boosts together — is a four-vector by definition.
The invariant quadratic form is packaged into the **metric tensor**,

$$
g_{\mu\nu} = \operatorname{diag}(+1,-1,-1,-1),
$$

three minus signs for the three space directions, one plus sign for time — a
*pseudo*-Euclidean signature, in contrast to an ordinary (positive-definite)
Euclidean metric. (This is the flat-spacetime special case of a much more general
idea: on a curved manifold like the surface of a sphere, $ds^2 = g_{ij}\,dx^i dx^j$
with $g_{ij}$ *varying* from point to point is exactly how general relativity
encodes curvature. Special relativity is the case where the $g_{\mu\nu}$ happen to be
constants everywhere — genuinely flat.)

The minus signs are the whole reason four-vectors come in two flavors. Given
$a^\mu$ (upper index, "contravariant"), define the **covariant** partner $a_\mu
\equiv g_{\mu\nu}a^\nu$ — numerically $a_0=a^0$, but $a_i = -a^i$ for the three space
components. Every rule of the notation exists to hide the minus signs automatically:

- **Contraction rule:** a repeated index must appear once up, once down, and is then
  summed (Einstein convention) and gone; a free index must match on both sides of an
  equation; an index appearing three times means an error.
- **Dot product:** $a\cdot b \equiv a^\mu b_\mu = a^0b^0 - \vec a\cdot\vec b$ — the
  spatial minus sign is now built into the notation rather than written by hand
  every time.
- **Raising and lowering:** $g^{\mu\nu}a_\nu = a^\mu$ and $g_{\mu\nu}g^{\nu\rho} =
  \delta_\mu^\rho$ (the metric is its own inverse here).
- **The gradient reverses the pattern:** $\partial_\mu \equiv \partial/\partial x^\mu
  = (\tfrac1c\partial_t,\,+\vec\nabla)$ while $\partial^\mu = (\tfrac1c\partial_t,\,-\vec\nabla)$
  — exactly backwards from $x^\mu=(ct,\vec r)$ vs. $x_\mu = (ct,-\vec r)$, so that
  $\partial_\mu x^\mu = 4$ comes out consistent, as it must.

## Spacetime geometry: light cones and the mass shell

The invariant $x\cdot x = c^2t^2 - r^2$ splits every point of spacetime, relative to
the origin, into three causal classes: **timelike** ($x\cdot x>0$, reachable at less
than light speed — always in the *definite* past or future of the origin, in every
frame), **spacelike** ($x\cdot x<0$, unreachable without exceeding $c$ — no
consistent time-ordering exists, and different observers can disagree on which event
happened first), and **lightlike** ($x\cdot x=0$, on the light cone itself). Because
$x\cdot x$ is Lorentz-invariant, a Lorentz transformation can never move an event from
one class to another — it can, however, freely slide a *spacelike* pair of events
back and forth in time-order (this is the relativity of simultaneity), or a
*timelike* pair back and forth in space (never reordering which came first).

The same invariance, applied to momentum instead of position, gives
$p\cdot p = E^2/c^2 - \vec p^{\,2} = m^2c^2$ — every free particle of mass $m$ is
confined to a fixed hyperbola (the **mass shell**) in energy-momentum space, however
it's boosted.

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import plotly.graph_objects as go
from plotly.subplots import make_subplots
from IPython.display import HTML

_plotlyjs_loaded = False


def show_fig(fig):
    """Embed a Plotly figure as self-contained HTML+JS. include_mathjax=False
    avoids Plotly's legacy MathJax v2 loader colliding with Sphinx's MathJax
    v3. plotly.js is embedded only the first time this runs on a page.
    """
    global _plotlyjs_loaded
    html = fig.to_html(full_html=False, include_mathjax=False,
                        include_plotlyjs=not _plotlyjs_loaded,
                        config={"responsive": True})
    _plotlyjs_loaded = True
    return HTML(html)
```

```{code-cell} ipython3
def fig_minkowski_massshell():
    u_values = np.linspace(0, 1.5, 30)  # rapidity of the boost
    R = 3.0

    fig = make_subplots(rows=1, cols=2, column_widths=[0.5, 0.5],
                         subplot_titles=("Minkowski diagram  (x, ct)", "Mass shell  (pc, E)"))

    fig.add_trace(go.Scatter(x=[-R, R], y=[-R, R], mode="lines", line=dict(color="goldenrod", width=2),
                              name="light cone", showlegend=False), row=1, col=1)
    fig.add_trace(go.Scatter(x=[-R, R], y=[R, -R], mode="lines", line=dict(color="goldenrod", width=2),
                              showlegend=False, hoverinfo="skip"), row=1, col=1)
    fig.add_trace(go.Scatter(x=[1.2, 1.2], y=[-R, R], mode="lines",
                              line=dict(color="gray", width=1.5, dash="dot"),
                              name="a particle at rest in S", showlegend=False), row=1, col=1)
    fig.add_trace(go.Scatter(x=[1.0], y=[2.2], mode="markers+text", marker=dict(size=10, color="firebrick"),
                              text=["event A"], textposition="top center", showlegend=False), row=1, col=1)

    def boosted_axes(u):
        t = np.tanh(u)
        xs1, ys1 = np.array([-R, R]), np.array([-R, R]) * t
        if u < 1e-9:
            xs2, ys2 = np.array([0.0, 0.0]), np.array([-R, R])
        else:
            ys2 = np.array([-R, R])
            xs2 = ys2 * t
        return (xs1, ys1), (xs2, ys2)

    (xs1, ys1), (xs2, ys2) = boosted_axes(u_values[0])
    fig.add_trace(go.Scatter(x=xs1, y=ys1, mode="lines", line=dict(color="steelblue", width=2.5), name="x′ axis (S′)"), row=1, col=1)
    fig.add_trace(go.Scatter(x=xs2, y=ys2, mode="lines", line=dict(color="seagreen", width=2.5), name="ct′ axis (S′)"), row=1, col=1)

    p_bg = np.linspace(-R, R, 200)
    fig.add_trace(go.Scatter(x=p_bg, y=np.sqrt(1 + p_bg**2), mode="lines", line=dict(color="black", width=1.5),
                              name="mass shell (m=1)", showlegend=False), row=1, col=2)
    fig.add_trace(go.Scatter(x=[-R, R], y=[R, R], mode="lines", line=dict(color="goldenrod", width=1, dash="dot"),
                              showlegend=False, hoverinfo="skip"), row=1, col=2)

    def massshell_point(u):
        return np.sinh(u), np.cosh(u)

    p0, E0 = massshell_point(u_values[0])
    fig.add_trace(go.Scatter(x=[p0], y=[E0], mode="markers", marker=dict(size=12, color="firebrick"),
                              name="the particle's (pc, E)"), row=1, col=2)

    frames = []
    for k, u in enumerate(u_values):
        (xs1, ys1), (xs2, ys2) = boosted_axes(u)
        p, E = massshell_point(u)
        frames.append(go.Frame(
            data=[go.Scatter(x=xs1, y=ys1), go.Scatter(x=xs2, y=ys2), go.Scatter(x=[p], y=[E])],
            traces=[4, 5, 8], name=f"{k}",
            layout=dict(title=f"Boost rapidity u = {u:.2f}   (v/c = {np.tanh(u):.3f})")))
    fig.frames = frames

    fig.update_xaxes(title_text="x", range=[-R, R], row=1, col=1)
    fig.update_yaxes(title_text="ct", range=[-R, R], row=1, col=1, scaleanchor="x", scaleratio=1)
    fig.update_xaxes(title_text="pc", range=[-R, R], row=1, col=2)
    fig.update_yaxes(title_text="E", range=[0, R], row=1, col=2)

    fig.update_layout(
        width=940, height=460,
        title=f"Boost rapidity u = {u_values[0]:.2f}   (v/c = {np.tanh(u_values[0]):.3f})",
        updatemenus=[dict(type="buttons", showactive=False, y=1.25, x=1.0, xanchor="right",
            buttons=[dict(label="▶ Boost", method="animate",
                          args=[None, dict(frame=dict(duration=100, redraw=True),
                                            fromcurrent=True, transition=dict(duration=0))]),
                     dict(label="⏸ Pause", method="animate", args=[[None], dict(mode="immediate")])])],
        sliders=[dict(active=0, x=0.08, len=0.9,
            steps=[dict(method="animate", label=f"{u:.1f}",
                        args=[[f"{k}"], dict(mode="immediate", frame=dict(redraw=True))])
                   for k, u in enumerate(u_values)])],
    )
    return fig


show_fig(fig_minkowski_massshell())
```

Drag the slider: on the left, the S′ axes tilt symmetrically toward the light cone
but never cross it — a boost is a "rotation" that can approach, but never reach,
$45°$. On the right, the *same* rapidity slides the particle's energy-momentum point
along the mass-shell hyperbola. Both panels are driven by exactly the same number
because both are exactly the same transformation, once written in the right
variable.

## Rapidity: the variable that actually adds up

That "right variable" deserves its own name. Ordinary velocities famously don't add:
boost by $v_1$ and then by $v_2$ (same direction) and the result is $v = (v_1+v_2)/(1
+v_1v_2/c^2)$, not $v_1+v_2$. But $v/c$ ranges only over $(-1,1)$, which is exactly
the range of $\tanh$ — suggesting **rapidity** $u \equiv \tanh^{-1}(v/c)$ as the
natural variable. In terms of $u$, $\gamma=\cosh u$ and $\gamma v/c = \sinh u$, so the
Lorentz boost matrix takes the manifestly rotation-like (but *hyperbolic*, matching
the pseudo-orthogonal metric) form

$$
\begin{pmatrix} ct' \\ x' \end{pmatrix} =
\begin{pmatrix} \cosh u & -\sinh u \\ -\sinh u & \cosh u \end{pmatrix}
\begin{pmatrix} ct \\ x \end{pmatrix},
$$

and the composition law becomes trivial: $u = u_1+u_2$. **Rapidities add exactly
like Newton would have expected velocities to — it's rapidity, not velocity, that
Galileo's intuition was reaching for.**

```{code-cell} ipython3
def fig_rapidity():
    u = np.linspace(-3, 3, 400)
    fig = go.Figure()
    fig.add_trace(go.Scatter(x=u, y=np.tanh(u), mode="lines", line=dict(color="steelblue", width=3),
                              name="v/c = tanh(u)  (exact)"))
    fig.add_trace(go.Scatter(x=u, y=u, mode="lines", line=dict(color="gray", width=1, dash="dot"),
                              name="v/c ≈ u  (small-u / Newtonian limit)"))
    fig.add_hline(y=1, line=dict(color="goldenrod", dash="dash"))
    fig.add_hline(y=-1, line=dict(color="goldenrod", dash="dash"))

    u1 = u2 = 1.0
    v1 = np.tanh(u1)
    v_correct, v_naive = np.tanh(u1 + u2), v1 + v1
    fig.add_trace(go.Scatter(x=[u1, u1 + u2], y=[v1, v_correct], mode="markers+text",
                              marker=dict(size=10, color="firebrick"), text=["u₁", "u₁+u₂"],
                              textposition="top center", name="rapidities simply add"))
    fig.add_annotation(x=u1 + u2, y=v_naive, ax=30, ay=-40, showarrow=True,
                        text=f"naive v₁+v₂ = {v_naive:.2f}c — impossible")
    fig.update_layout(title="Rapidities add linearly; velocities never can exceed c",
                       xaxis_title="rapidity  u = tanh⁻¹(v/c)", yaxis_title="v / c",
                       width=780, height=460)
    return fig


show_fig(fig_rapidity())
```

(One caution the composition law hides: this simple addition only works for boosts
in the *same* direction. Two boosts in different directions compose into a boost
*plus* a rotation — **boosts alone don't form a subgroup** of the Lorentz group,
only rotations do. This extra rotation, applied to a spinning object dragged through
a sequence of non-collinear boosts, is the relativistic effect known as Thomas
precession.)

## Covariant electrodynamics in one line

The four-vector machinery earns its keep immediately on Maxwell's equations. Package
charge density and current into a four-current $j^\mu=(c\rho,\vec\jmath)$; the
continuity equation collapses to $\partial_\mu j^\mu = 0$ — manifestly the same
statement, hence charge conservation, in *every* frame. Package the scalar and vector
potentials into $A^\mu = (\phi/c,\vec A)$; the Lorenz gauge condition becomes
$\partial_\mu A^\mu=0$ (as opposed to the Coulomb gauge $\vec\nabla\cdot\vec A=0$
alone, which is *not* Lorentz-covariant — imposing it in one frame doesn't preserve
it in another). In this gauge the wave equations for $\phi$ and $\vec A$ merge into
one four-dimensional statement, $\Box A^\mu = \mu_0 j^\mu$, where $\Box \equiv
\partial_\mu\partial^\mu = \tfrac1{c^2}\partial_t^2-\nabla^2$ is the
**d'Alembertian** — *all four* of Maxwell's equations, in one line. (Setting the
source to zero and translating $E,\vec p \to i\hbar\partial_t, -i\hbar\vec\nabla$
turns this into the Klein–Gordon equation for a relativistic particle — a striking
aside, though a detour from where this lecture is headed.)

The electric and magnetic fields themselves combine into the antisymmetric rank-2
**field tensor** $F^{\mu\nu} \equiv \partial^\mu A^\nu - \partial^\nu A^\mu$: 16
components, but the diagonal vanishes and antisymmetry ties the lower triangle to the
upper, leaving exactly 6 independent numbers — precisely $E_x,E_y,E_z,B_x,B_y,B_z$.

```{code-cell} ipython3
def fig_field_tensor():
    labels = [["0", "−Eₓ/c", "−Eᵧ/c", "−E_z/c"],
              ["Eₓ/c", "0", "−B_z", "Bᵧ"],
              ["Eᵧ/c", "B_z", "0", "−Bₓ"],
              ["E_z/c", "−Bᵧ", "Bₓ", "0"]]
    z = [[0, -1, -1, -1], [1, 0, -2, 2], [1, 2, 0, -2], [1, -2, 2, 0]]
    fig = go.Figure(data=go.Heatmap(z=z, text=labels, texttemplate="%{text}", colorscale="RdBu",
                                     showscale=False, xgap=3, ygap=3, zmid=0))
    fig.update_layout(title="Field tensor Fᵘᵛ = ∂ᵘAᵛ − ∂ᵛAᵘ",
                       xaxis=dict(title="ν", tickvals=[0, 1, 2, 3]),
                       yaxis=dict(title="μ", tickvals=[0, 1, 2, 3], autorange="reversed"),
                       width=420, height=420)
    return fig


show_fig(fig_field_tensor())
```

Two, and only two, independent Lorentz scalars can be built from $F^{\mu\nu}$: $F_{\mu\nu}F^{\mu\nu}
\propto B^2 - E^2/c^2$ (up to normalization, this *is* the electromagnetic
Lagrangian density) and $F_{\mu\nu}\tilde F^{\mu\nu} \propto \vec E\cdot\vec B$
(built with the dual tensor $\tilde F^{\mu\nu}$, which swaps the roles of $\vec E$
and $\vec B$). Both survive unchanged under *any* boost — which is exactly why "is
this radiation transverse, with $\vec E\perp\vec B$" is a frame-independent question,
even though $\vec E$ and $\vec B$ individually are not frame-independent at all.

## Boosting a field: how E and B mix

That individually-not-invariant behavior has an exact formula. Split a field into
components parallel and perpendicular to the boost velocity $\vec v$:

$$
\vec E'_\parallel = \vec E_\parallel, \qquad \vec B'_\parallel = \vec B_\parallel,
\qquad
\vec E'_\perp = \gamma\big(\vec E_\perp + \vec v\times\vec B\big), \qquad
\vec B'_\perp = \gamma\Big(\vec B_\perp - \frac{\vec v\times\vec E}{c^2}\Big).
$$

The components along the boost don't change at all; the transverse components mix
into each other with a factor of $\gamma$. Watch what this means physically: stand
next to a charge in its rest frame and you see a pure electric field, no magnetism
at all. Walk past it (equivalently, boost the field) and a **magnetic field appears
out of nothing** — magnetism is what electricity looks like from a moving frame.

```{code-cell} ipython3
def fig_EB_boost():
    E0 = 1.0
    beta_values = np.linspace(0, 0.95, 40)

    def fields(beta):
        gamma = 1 / np.sqrt(1 - beta**2)
        return gamma * E0, gamma * beta * E0  # E' along x, B' along y = (v ẑ) x (E x̂)

    fig = go.Figure()
    Ep0, Bp0 = fields(beta_values[0])
    fig.add_trace(go.Scatter(x=[0, Ep0], y=[0, 0], mode="lines+markers",
                              line=dict(color="firebrick", width=4), marker=dict(size=[0, 10]), name="E′ (transverse)"))
    fig.add_trace(go.Scatter(x=[0, 0], y=[0, Bp0], mode="lines+markers",
                              line=dict(color="steelblue", width=4), marker=dict(size=[0, 10]), name="B′ (transverse, ⊥ E′)"))

    frames = []
    for k, beta in enumerate(beta_values):
        Ep, Bp = fields(beta)
        frames.append(go.Frame(
            data=[go.Scatter(x=[0, Ep], y=[0, 0]), go.Scatter(x=[0, 0], y=[0, Bp])],
            traces=[0, 1], name=f"{k}",
            layout=dict(title=f"v/c = {beta:.2f}   —   E′² − c²B′² = {Ep**2 - Bp**2:.4f}   (invariant: stays = E₀² = 1)")))
    fig.frames = frames

    fig.update_xaxes(title_text="E′", range=[-0.3, 3.5])
    fig.update_yaxes(title_text="B′", range=[-0.3, 3.5], scaleanchor="x", scaleratio=1)
    fig.update_layout(
        title=f"v/c = {beta_values[0]:.2f}   —   E′² − c²B′² = {Ep0**2 - Bp0**2:.4f}   (invariant: stays = E₀² = 1)",
        width=680, height=520,
        updatemenus=[dict(type="buttons", showactive=False, y=1.15, x=1.0, xanchor="right",
            buttons=[dict(label="▶ Boost", method="animate",
                          args=[None, dict(frame=dict(duration=100, redraw=True),
                                            fromcurrent=True, transition=dict(duration=0))]),
                     dict(label="⏸ Pause", method="animate", args=[[None], dict(mode="immediate")])])],
        sliders=[dict(active=0, x=0.08, len=0.9, currentvalue=dict(prefix="v/c = ", visible=True),
            steps=[dict(method="animate", label=f"{b:.2f}",
                        args=[[f"{k}"], dict(mode="immediate", frame=dict(redraw=True))])
                   for k, b in enumerate(beta_values)])],
    )
    return fig


show_fig(fig_EB_boost())
```

Start with pure $\vec E$ ($B_0=0$) and drag the slider: $\vec E'$ grows by $\gamma$
while an entirely new $\vec B'$, perpendicular to both the boost and $\vec E$, grows
right alongside it — and the title tracks $E'^2-c^2B'^2$ recomputed at every frame,
landing on exactly $E_0^2$ throughout. That's the invariant from the previous section,
verified rather than merely asserted: electricity and magnetism were never two
different fields, only one field looked at from different states of motion.

## Relativistic dynamics of a charged particle

The free-particle Lagrangian that reproduces the correct (nonlinear) relativistic
momentum $\vec p = m\vec v/\sqrt{1-v^2/c^2}$ is $L = -mc^2\sqrt{1-v^2/c^2}$ — check it
directly: $\partial L/\partial\vec v$ gives exactly that $\vec p$, and $\partial
L/\partial\vec r=0$ (free particle) makes the Euler–Lagrange equation say $\vec p$ is
conserved, as it must be. Coupling to an electromagnetic field costs nothing beyond
the same interaction term used non-relativistically, $L_{\text{int}} = e\vec
A\cdot\vec v - e\phi$ (covariantly, $\propto j^\mu A_\mu$) — the *simplest* Lorentz
scalar linear in both the current and the potential, called **minimal coupling**.
Every consequence of switching on the field turns out to be the single replacement

$$
p_\mu \;\longrightarrow\; p_\mu - eA_\mu,
$$

applied uniformly to the free-particle energy–momentum relation, the canonical
momentum, and the Hamiltonian alike. Grinding through the Euler–Lagrange equation
with this Lagrangian reproduces the exact relativistic equation of motion,

$$
\frac{d}{dt}\left(\frac{m\vec v}{\sqrt{1-v^2/c^2}}\right) = e\big(\vec E + \vec v\times\vec B\big),
$$

the same Lorentz force as always, now acting on the relativistic momentum rather than
$m\vec v$ — which, worked through to an explicit equation for $\dot{\vec v}$, picks up
an extra $\vec v(\vec v\cdot\vec E)/c^2$ term that vanishes smoothly in the $v\ll c$
limit, recovering the non-relativistic Lorentz force exactly.

## Closing: the Poincaré group, and where mass and spin come from

Pull every symmetry of flat spacetime together — 4 translations (space and time
alike) plus the 6-parameter Lorentz group $SO(3,1)$ (3 rotations, 3 boosts) — and you
get the full **Poincaré group**, 10 parameters in all. It isn't simply a direct
product of the two pieces: translating and then Lorentz-transforming is *not* the
same as Lorentz-transforming and then translating by the same amount, because the
Lorentz transformation acts on the translation too. (Composing $(\Lambda_1,a_1)$ then
$(\Lambda_2,a_2)$ gives $(\Lambda_2\Lambda_1,\ \Lambda_2 a_1+a_2)$ — the translations
form an *abelian normal subgroup* that the Lorentz part acts on, making the whole
thing a **semidirect product** $SO(3,1)\ltimes T(4)$.)

This is where the story closes the loop back to Noether's theorem at the very
beginning. Every one of the Poincaré group's 10 generators is a conserved quantity:
the 4 translation generators are the **four-momentum** $P^\mu$ (energy and
momentum — literally the same conservation laws derived by hand in the prelude, now
promoted to spacetime), and the 6 Lorentz generators $J^{\mu\nu}$ package ordinary
angular momentum together with the boost generators. A group like this has
**Casimir invariants** — special combinations of the generators that commute with
*everything* in the algebra, and therefore label its representations, the same way
$\vec J^2$ commuting with every $J_i$ is why hydrogen-atom states carry a definite
total angular momentum quantum number. The Poincaré group has exactly two: $P^\mu
P_\mu$, whose eigenvalue is (up to $c^2$) the square of the particle's **rest mass**,
and a more elaborate combination $W^\mu W_\mu$ built from both $J$'s and $P$'s, whose
eigenvalue fixes the particle's **spin**.

Mass and spin, in other words, are not extra ingredients bolted onto quantum particles
— they are literally *the labels of an irreducible representation of the symmetry
group of spacetime itself.* Every other quantum number a particle carries (charge,
baryon number, and the rest) has to come from somewhere else; mass and spin come
from nothing more than requiring the laws of physics to look the same to every
inertial observer. It is a fitting place to end a course that opened with orders of
magnitude and the regimes of physics, and ends by discovering that geometry alone —
the honest insistence that no frame is special — is enough to conjure up two of the
most basic properties any particle can have. What comes next is to see how all of
this reads once matter is described not by trajectories but by wavefunctions: quantum
mechanics.
