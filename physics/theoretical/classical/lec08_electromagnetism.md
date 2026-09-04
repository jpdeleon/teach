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

# Lecture 8–9 — Classical Electromagnetism: Potentials, Gauge Invariance, and the Charged-Particle Lagrangian

*Source: [NPTEL Classical Physics, Mod-01 Lec-08](https://www.youtube.com/watch?v=bsybS5fZGjY&list=PL5E4E56893588CBA8&index=9)
(Summary of classical electromagnetism) and
[Mod-01 Lec-09](https://www.youtube.com/watch?v=qVwrVUzwt6U&list=PL5E4E56893588CBA8&index=10)
(Charged particle in an electromagnetic field), Prof. V. Balakrishnan.*

[Lecture 7](lec07_lagrangian.md) built the Lagrangian machinery in the abstract. These two
lectures put it to work on electromagnetism — and along the way, hand back a much sharper
version of the "Lagrangian is not unique" observation from the Atwood machine: this time
the non-uniqueness is forced on you by a genuine physical principle, gauge invariance, and
it survives verbatim into the general theory as the freedom to add any total time
derivative to $L$.

## Maxwell's equations and a counting problem

In free space, all of classical electricity and magnetism compresses into four equations:

$$
\nabla\cdot\vec E = \frac{\rho}{\epsilon_0}, \qquad
\nabla\cdot\vec B = 0, \qquad
\nabla\times\vec E = -\frac{\partial \vec B}{\partial t}, \qquad
\nabla\times\vec B = \mu_0\vec j + \mu_0\epsilon_0\frac{\partial \vec E}{\partial t}.
$$

Written out by component, the two curl equations are three scalar equations each and the
two divergence equations are one each: **eight** scalar equations in total, for just **six**
unknowns, the components of $\vec E$ and $\vec B$ ($\rho,\vec j$ are the given sources).
Eight equations for six unknowns should generically have no solution at all — and yet
electromagnetic fields plainly exist. The resolution is that two of the eight equations
aren't independent: take the divergence of the Ampère–Maxwell law and substitute Gauss's
law, and the **continuity equation** $\partial\rho/\partial t + \nabla\cdot\vec j = 0$ falls
out as a consistency requirement. Given that charge is conserved, the two divergence
equations behave as **constraints on the initial data** rather than as extra independent
evolution equations — once satisfied at one instant, the curl equations preserve them for
all time. Only six pieces of information are truly independent, matching six unknowns.

The two source-free equations ($\nabla\cdot\vec B = 0$ and $\nabla\times\vec E +
\partial\vec B/\partial t = 0$) are called **homogeneous**: every electric and magnetic
field must satisfy them regardless of what the sources are doing. It pays to exhaust their
content first.

## From six fields to four potentials

Two vector identities do all the work: the divergence of any curl vanishes identically,
$\nabla\cdot(\nabla\times\vec V) \equiv 0$, and the curl of any gradient vanishes
identically, $\nabla\times(\nabla u) \equiv 0$ (both are two-line index-notation checks —
contracting the antisymmetric Levi-Civita symbol against a symmetric partial-derivative
pair always gives zero, and these turn out to be the *only* identities of this kind).

Since $\nabla\cdot\vec B \equiv 0$, $\vec B$ must always be expressible as the curl of some
other field, the **vector potential** $\vec A(\vec r, t)$:

$$
\vec B = \nabla\times\vec A.
$$

Substituting into $\nabla\times\vec E + \partial\vec B/\partial t = 0$ and commuting the curl
with the (partial, hence order-independent) time derivative gives
$\nabla\times\big(\vec E + \partial\vec A/\partial t\big) = 0$ — an identically curl-free
field, hence a gradient of some **scalar potential** $\phi$:

$$
\vec E = -\frac{\partial \vec A}{\partial t} - \nabla\phi
$$

(the minus sign is pure convention, chosen so $\phi$ reduces to the familiar electrostatic
potential when nothing depends on time). The two homogeneous Maxwell equations are now
completely accounted for — six unknowns in $\vec E,\vec B$ have become four in $\phi,\vec A$
($\phi$ contributing one, $\vec A$ three), with the "extra" two components of freedom
exactly the redundancy the counting argument above predicted.

## Why divergence and curl, and nothing else?

A vector field $\vec V$ has nine independent partial derivatives $\partial_i V_j$ at each
point. Why do physical laws only ever seem to care about two particular combinations of
them — the trace $\nabla\cdot\vec V$ (a scalar) and the antisymmetric part $\nabla\times\vec
V$ (a vector)? Trace and antisymmetric part are exactly the pieces of a rank-2 tensor that
are invariant in *form* under rotations — that's why they're the physically meaningful
combinations, rather than some other slice of the nine numbers.

The deeper reason they're also *sufficient* — that divergence and curl (plus suitable
boundary behavior) pin a vector field down completely — is the **Helmholtz theorem**, and
it has a clean proof via Fourier analysis. A plane wave $\vec V(\vec r) = \vec a\, e^{i\vec
k\cdot\vec r}$ is a simultaneous eigenfunction of both operators:

$$
\nabla\cdot\vec V = i(\vec k\cdot\vec a)\, e^{i\vec k\cdot\vec r}, \qquad
\nabla\times\vec V = i(\vec k\times\vec a)\, e^{i\vec k\cdot\vec r},
$$

turning the differential operators into pure algebra — this is exactly what a Fourier
transform does. The divergence sees only the component of $\vec a$ **along** $\vec k$ (the
**longitudinal** part); the curl sees only the component **perpendicular** to $\vec k$ (the
**transverse** part). Any respectable vector field is a superposition of such plane waves
over all $\vec k$, so specifying divergence and curl at every $\vec k$ — longitudinal and
transverse information together — fixes the entire field.

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import plotly.graph_objects as go
import plotly.figure_factory as ff
from scipy.integrate import solve_ivp
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


K = 1.0
x_grid = np.linspace(0, 2 * np.pi, 14)
y_grid = np.linspace(-1.0, 1.0, 5)
X, Y = np.meshgrid(x_grid, y_grid)


def wave_field(theta_deg):
    theta = np.radians(theta_deg)
    ax, ay = np.cos(theta), np.sin(theta)
    Vx = ax * np.cos(K * X) * np.ones_like(Y)
    Vy = ay * np.cos(K * X) * np.ones_like(Y)
    return Vx, Vy


CASES1 = [
    dict(name="θ = 0°  (a ∥ k — purely longitudinal: div ≠ 0, curl = 0)", theta=0),
    dict(name="θ = 45°  (mixed)", theta=45),
    dict(name="θ = 90°  (a ⊥ k — purely transverse: div = 0, curl ≠ 0)", theta=90),
]


def fig_longitudinal_transverse():
    Vx0, Vy0 = wave_field(CASES1[0]["theta"])
    base = ff.create_quiver(X, Y, Vx0, Vy0, scale=0.35, arrow_scale=0.3,
                             line=dict(width=2, color="steelblue"), name="V(x,y)")
    fig = go.Figure(data=base.data)

    frames = []
    for k, c in enumerate(CASES1):
        Vx, Vy = wave_field(c["theta"])
        qf = ff.create_quiver(X, Y, Vx, Vy, scale=0.35, arrow_scale=0.3,
                               line=dict(width=2, color="steelblue"))
        frames.append(go.Frame(data=[qf.data[0]], traces=[0], name=f"{k}",
                                layout=dict(title=c["name"])))
    fig.frames = frames

    fig.update_xaxes(title_text="x  (propagation direction k)", range=[-0.5, 7.3])
    fig.update_yaxes(title_text="y", range=[-1.6, 1.6], scaleanchor="x", scaleratio=1)
    fig.update_layout(
        title=CASES1[0]["name"], width=820, height=380,
        updatemenus=[dict(type="buttons", showactive=False, y=1.3, x=1.0, xanchor="right",
            buttons=[dict(label="▶ Rotate the amplitude", method="animate",
                          args=[None, dict(frame=dict(duration=1400, redraw=True),
                                            fromcurrent=True, transition=dict(duration=300))]),
                     dict(label="⏸ Pause", method="animate",
                          args=[[None], dict(mode="immediate")])])],
        sliders=[dict(active=0, x=0.08, len=0.9,
            steps=[dict(method="animate", label=c["name"].split("  ")[0],
                        args=[[f"{k}"], dict(mode="immediate", frame=dict(redraw=True))])
                   for k, c in enumerate(CASES1)])],
    )
    return fig


show_fig(fig_longitudinal_transverse())
```

At $\theta = 0°$ the arrows only ever point along $x$, growing and shrinking in length as
$x$ advances — a compressional, sound-wave-like pattern with divergence but no rotation. At
$\theta = 90°$ the arrows are perpendicular to $x$ and only their transverse height
oscillates — a shear pattern with curl but no divergence, the shape an electromagnetic wave
actually takes. Every intermediate angle is some mixture of the two, and that mixture is
exactly what the divergence and curl equations, taken together, are designed to separate
back out.

## The potential equations, and a digression on the Laplacian

Substituting $\vec E,\vec B$ in terms of $\phi,\vec A$ into the two *inhomogeneous* Maxwell
equations, and using the identity $\nabla\times(\nabla\times\vec A) = \nabla(\nabla\cdot\vec
A) - \nabla^2\vec A$, produces two coupled second-order equations:

$$
\nabla^2\phi + \frac{\partial}{\partial t}(\nabla\cdot\vec A) = -\frac{\rho}{\epsilon_0},
\qquad
\Box \vec A + \nabla\!\left(\nabla\cdot\vec A + \frac{1}{c^2}\frac{\partial \phi}{\partial t}\right) = \mu_0\vec j,
$$

where $\Box \equiv \frac{1}{c^2}\frac{\partial^2}{\partial t^2} - \nabla^2$ is the
**d'Alembertian**, the four-dimensional generalization of the Laplacian $\nabla^2$ that
governs the wave equation ($c \equiv 1/\sqrt{\mu_0\epsilon_0}$, the speed of light falling
straight out of the equations). This is the price of eliminating two of six field components:
the equations are now second order instead of first.

The Laplacian deserves a short digression, because it explains a fact worth knowing on its
own. A function with $\nabla^2\phi = 0$ (a **harmonic** function) obeys a **mean value
property**: its value at any point equals the average of its values over any sphere
centered there. In one dimension harmonic just means "straight line" — zero second
derivative, zero curvature, and $f(x) = \frac12\big[f(x+\epsilon)+f(x-\epsilon)\big]$
follows immediately from the definition of the second derivative as a limit of that very
combination. The same argument, symmetrized over more points, promotes to any number of
dimensions. A direct consequence in electrostatics — **Poisson's theorem** — is that a
charge-free region can never contain a point of stable equilibrium for another charge held
there by electrostatic forces alone: a true minimum of $\phi$ would need every neighboring
value to be *larger*, but the mean value property forbids that whenever $\nabla^2\phi=0$; at
best you get a saddle.

## Gauge invariance

Are $\phi$ and $\vec A$ themselves unique? No. Since $\nabla\times(\nabla\chi) \equiv 0$ for
*any* scalar field $\chi(\vec r,t)$, the shift

$$
\vec A \to \vec A' = \vec A + \nabla\chi, \qquad
\phi \to \phi' = \phi - \frac{\partial \chi}{\partial t}
$$

leaves $\vec B = \nabla\times\vec A$ and $\vec E = -\partial\vec A/\partial t - \nabla\phi$
completely unchanged — direct substitution shows the extra terms cancel exactly. This is
**gauge invariance**: infinitely many pairs $(\phi,\vec A)$ describe the same physical
$\vec E,\vec B$, related by an arbitrary **gauge function** $\chi$. $\rho$ and $\vec j$ are
physical and gauge-invariant, and so are $\vec E$ and $\vec B$ — the energy density
$\tfrac12(\epsilon_0 E^2 + B^2/\mu_0)$ and the Poynting momentum density $\vec E\times\vec
B$ depend only on the fields, never on the potentials directly. $\phi$ and $\vec A$ are
auxiliary bookkeeping, and that freedom is there to be exploited, not apologized for.

**Coulomb gauge.** Given *any* $\vec A$ with $\nabla\cdot\vec A = f(\vec r,t) \ne 0$, choose
$\chi$ to solve $\nabla^2\chi = -f$ (a Poisson equation, always solvable given suitable
boundary conditions) and the new $\vec A'$ satisfies $\nabla\cdot\vec A' = 0$ identically.
In this gauge the $\phi$-equation above collapses to an ordinary **Poisson equation**,
$\nabla^2\phi = -\rho/\epsilon_0$, completely decoupled from $\vec A$.

**Lorenz gauge.** The same trick, now solving the *wave* equation $\Box\chi = -g$ for
whatever $g \equiv \nabla\cdot\vec A + \tfrac{1}{c^2}\partial\phi/\partial t$ happens to be,
enforces $\nabla\cdot\vec A' + \tfrac1{c^2}\partial\phi'/\partial t = 0$ instead. This
decouples the *other* way: both equations become clean wave equations, $\Box\vec A =
\mu_0\vec j$ and $\Box\phi = \rho/\epsilon_0$.

You cannot enforce both conditions simultaneously — gauge freedom is exactly *one* scalar
function $\chi$, and each condition already uses it up. Nor can you gauge $\vec A$ to zero
everywhere: $\chi$ is a scalar, $\vec A$ a vector, and a nonzero $\vec B$ has to come from
somewhere. You *can*, however, gauge $\phi$ to zero even in electrostatics — a static
uniform field $\vec E = E_0\hat e_x$ is reproduced with no scalar potential at all by
$\vec A(t) = -E_0 t\,\hat e_x$, $\phi \equiv 0$, since $\nabla\times\vec A = 0$ (it doesn't
depend on position) while $-\partial\vec A/\partial t = E_0\hat e_x$ exactly. It's a
thoroughly impractical way to do electrostatics — you'd have to know the field before
constructing the potential that reproduces it — but it demonstrates that $\vec E =
-\nabla\phi$ is a Coulomb-gauge *habit*, not a law.

The Coulomb-gauge condition $\nabla\cdot\vec A = 0$ is not preserved under a boost to another
inertial frame; the Lorenz condition is, because $\big(\phi/c,\vec A\big)$ transforms as a
four-vector exactly like $(ct,\vec r)$ does — and so does $(c\rho,\vec j)$ — making
$\nabla\cdot\vec A + \tfrac1{c^2}\partial\phi/\partial t$ a Lorentz-invariant scalar. Set it
to zero in one frame and it stays zero in every frame, which is precisely why the Lorenz
gauge is the natural choice once relativity is in the picture, even though the Coulomb
gauge is often more convenient for a calculation done in one fixed frame.

## The Lagrangian for a charged particle

Now couple a particle of charge $q$ and (non-relativistic) velocity $\vec v$ to an external
electromagnetic field. The Lagrangian that reproduces the correct equation of motion is

$$
L(\vec r,\vec v,t) = \tfrac12 m v^2 + q\,\vec A(\vec r,t)\cdot\vec v - q\,\phi(\vec r,t).
$$

It doesn't look like the familiar $T-V$: the magnetic force is velocity-dependent, which
$T-V$ can never produce. The motivation, made precise later via relativity, is that
$q\phi - q\vec A\cdot\vec v$ is (up to a sign and a factor of $c$) the four-dimensional dot
product of the particle's four-current with the field's four-potential, $j^\mu A_\mu$ — the
simplest possible scalar coupling between "some property of the particle" and "some
property of the field," known as **minimal coupling**. It's been verified experimentally to
better than ten decimal places in quantum electrodynamics.

Deriving the equations of motion needs one piece of care: $\vec A(\vec r(t), t)$ depends on
time both explicitly and through the particle's trajectory $\vec r(t)$, so
$\frac{d}{dt}\frac{\partial L}{\partial \dot x}$ is a genuine **total** time derivative, not
a partial one — a point worth pausing on, since forgetting it silently drops exactly the
terms that turn out to matter. Working out the $x$-component (the others follow by
symmetry):

$$
\frac{\partial L}{\partial \dot x} = m\dot x + qA_x, \qquad
\frac{\partial L}{\partial x} = q\left(\frac{\partial A_x}{\partial x}\dot x + \frac{\partial A_y}{\partial x}\dot y + \frac{\partial A_z}{\partial x}\dot z\right) - q\frac{\partial \phi}{\partial x}.
$$

Substituting into the Euler–Lagrange equation and expanding the total derivative
$\frac{d}{dt}(qA_x) = q\big(\frac{\partial A_x}{\partial t} + \vec v\cdot\nabla A_x\big)$, most
of the terms rearrange into $\left(-\frac{\partial A_x}{\partial t} - \frac{\partial
\phi}{\partial x}\right) = E_x$, and the leftover velocity-cross-derivative terms collapse
(using $\vec B = \nabla\times\vec A$) into the $x$-component of $\vec v\times\vec B$. The
$y,z$ components go through identically, and the vector statement is the **Lorentz force
law**,

$$
m\frac{d\vec v}{dt} = q\vec E + q\,\vec v\times\vec B,
$$

recovered from a Lagrangian built entirely out of the (non-unique) potentials, landing on
an equation built entirely out of the (unique) fields — exactly as gauge invariance
demands.

## The Lagrangian's own gauge freedom

Since $\vec E,\vec B$ don't care which gauge produced them, neither should the physics of
$L$ — but $L$ itself, written in terms of $\phi,\vec A$, visibly *does* change under a gauge
transformation. Substituting $\vec A' = \vec A+\nabla\chi$, $\phi' = \phi -
\partial\chi/\partial t$,

$$
L' = \tfrac12 mv^2 + q\vec A'\cdot\vec v - q\phi'
   = L + q\left(\nabla\chi\cdot\vec v + \frac{\partial \chi}{\partial t}\right)
   = L + q\,\frac{d\chi}{dt},
$$

using the chain rule $\frac{d\chi}{dt} = \frac{\partial \chi}{\partial t} + \vec
v\cdot\nabla\chi$ for a function $\chi(\vec r(t),t)$ evaluated along the trajectory (the
second piece is what fluid dynamics calls the convective derivative). A gauge
transformation shifts the Lagrangian by the **total time derivative of a scalar function of
$q$ and $t$ alone** — and that's harmless for the action: $\int_{t_1}^{t_2}\frac{dF}{dt}\,dt
= F(q(t_2),t_2) - F(q(t_1),t_1)$ depends only on the fixed endpoints, where every variation
$\delta q$ vanishes by construction, so it contributes nothing to $\delta S = 0$ and the
Euler–Lagrange equations are untouched.

This is a completely general statement, with nothing electromagnetic left in it: for *any*
system, $L$ and $L' = L + \frac{d}{dt}F(q,t)$ give identical equations of motion, for
arbitrary $F$ depending on the coordinates and time (not the velocities — that needs extra
conditions on $F$ and is a different story). The electromagnetic gauge transformation is
just the first, most physical instance of it. The same freedom reappears in the Hamiltonian
formalism as a **canonical transformation** — a preview of where this is headed next.

## Constants of the motion and cyclic coordinates

A trajectory through $2n$-dimensional phase space is a one-dimensional curve. Each
independent constant of the motion — a function of $(q,\dot q)$ that stays fixed along the
trajectory — pins the motion to a $(2n-1)$-dimensional surface, and two independent
constants intersect in a $(2n-2)$-dimensional surface, and so on: to isolate a single curve
you generically need $2n-1$ constants of the motion. Finding even one is real progress; the
harmonic oscillator's phase portrait was already fully organized by a single one, the
energy.

The easiest constants to spot come from **cyclic** (ignorable) coordinates: if $L$ simply
doesn't depend on some $q_j$, the Euler–Lagrange equation for it reads
$\frac{d}{dt}\frac{\partial L}{\partial \dot q_j} = 0$ outright, so

$$
p_j \equiv \frac{\partial L}{\partial \dot q_j} \quad\text{is a constant of the motion} —
$$

the **momentum conjugate to $q_j$**, a piece of notation and terminology that becomes
central once the Hamiltonian formalism reorganizes everything around $(q,p)$ instead of
$(q,\dot q)$.

## Worked example: central forces and Kepler's second law

For a particle confined to a plane under a force that depends only on distance from the
origin, plane polar coordinates $(\rho,\phi)$ give

$$
L = \tfrac12 m\big(\dot\rho^2 + \rho^2\dot\phi^2\big) - V(\rho).
$$

$\phi$ never appears undifferentiated — it's manifestly cyclic — so

$$
p_\phi = \frac{\partial L}{\partial \dot\phi} = m\rho^2\dot\phi
$$

is conserved: this is the angular momentum, falling out as an immediate corollary of
$\phi$'s absence from $L$, rather than needing a separate torque argument. It would have
stayed hidden working in Cartesian coordinates $x,y$, where neither is cyclic — the choice
of coordinates itself is doing real work here, exposing a symmetry that was already there.
Two constants of the motion are in hand this way (angular momentum and the total energy),
one short of the three needed to fully pin down the $2\times2=4$-dimensional phase-space
trajectory — though, as will become a running theme, having $n$ constants for a $2n$-
dimensional phase space is frequently enough to integrate the problem completely.

$m\rho^2\dot\phi = \text{const}$ has an immediate geometric meaning: the area swept out by
the radius vector per unit time, $\frac12\rho^2\dot\phi$, is constant — **Kepler's second
law**, for *any* central force, not only the inverse-square law. It's exactly the flip side
of [Lecture 3–4](lec03_dynamics.md)'s Kepler's-*third*-law scaling argument, obtained this
time from a symmetry of $L$ rather than from a scaling argument on the equation of motion.

```{code-cell} ipython3
:tags: [hide-input]

GM = 1.0
E_ECC = 0.6
P_LATUS = 1.0
A_SEMI = P_LATUS / (1 - E_ECC**2)
R_PERI = P_LATUS / (1 + E_ECC)
V_PERI = np.sqrt(GM * (2 / R_PERI - 1 / A_SEMI))
T_PERIOD = 2 * np.pi * np.sqrt(A_SEMI**3 / GM)


def rhs(t, state):
    x, y, vx, vy = state
    r = np.hypot(x, y)
    return [vx, vy, -GM * x / r**3, -GM * y / r**3]


sol = solve_ivp(rhs, [0, T_PERIOD], [R_PERI, 0.0, 0.0, V_PERI],
                 max_step=T_PERIOD / 4000, dense_output=True, rtol=1e-10, atol=1e-10)

t_full = np.linspace(0, T_PERIOD, 600)
orbit = sol.sol(t_full)
x_orbit, y_orbit = orbit[0], orbit[1]

DT_SECTOR = 0.08 * T_PERIOD
START_FRACTIONS = [0.0, 0.15, 0.30, 0.5, 0.65, 0.85]


def sector_xy(t0, dt, n=60):
    ts = np.linspace(t0, t0 + dt, n)
    xy_ = sol.sol(ts)
    return xy_[0], xy_[1]


def swept_area(x_, y_):
    return 0.5 * np.abs(np.sum(x_[:-1] * y_[1:] - x_[1:] * y_[:-1]))


def fig_kepler_areas():
    xs0, ys0 = sector_xy(START_FRACTIONS[0] * T_PERIOD, DT_SECTOR)
    xs0_fill = np.concatenate([[0.0], xs0, [0.0]])
    ys0_fill = np.concatenate([[0.0], ys0, [0.0]])
    A0 = swept_area(xs0, ys0)
    r0 = np.hypot(xs0[0], ys0[0])

    fig = go.Figure()
    fig.add_trace(go.Scatter(x=x_orbit, y=y_orbit, mode="lines",
                              line=dict(color="black", width=1.5), name="orbit"))
    fig.add_trace(go.Scatter(x=[0], y=[0], mode="markers",
                              marker=dict(size=10, color="orange"), name="focus (center of force)"))
    fig.add_trace(go.Scatter(x=xs0_fill, y=ys0_fill, mode="lines", fill="toself",
                              fillcolor="rgba(178,34,34,0.45)",
                              line=dict(color="firebrick", width=1), name="swept sector"))

    frames = []
    for k, frac in enumerate(START_FRACTIONS):
        xs, ys = sector_xy(frac * T_PERIOD, DT_SECTOR)
        xs_fill = np.concatenate([[0.0], xs, [0.0]])
        ys_fill = np.concatenate([[0.0], ys, [0.0]])
        A = swept_area(xs, ys)
        r_here = np.hypot(xs[0], ys[0])
        title = f"r = {r_here:.2f}:  ΔA = {A:.4f}  (same Δt = {DT_SECTOR:.2f} every time)"
        frames.append(go.Frame(data=[go.Scatter(x=x_orbit, y=y_orbit),
                                      go.Scatter(x=[0], y=[0]),
                                      go.Scatter(x=xs_fill, y=ys_fill)],
                                traces=[0, 1, 2], name=f"{k}", layout=dict(title=title)))
    fig.frames = frames

    fig.update_xaxes(title_text="x", range=[-3.0, 1.5])
    fig.update_yaxes(title_text="y", range=[-2.2, 2.2], scaleanchor="x", scaleratio=1)
    fig.update_layout(
        title=f"r = {r0:.2f}:  ΔA = {A0:.4f}  (same Δt = {DT_SECTOR:.2f} every time)",
        width=680, height=560,
        updatemenus=[dict(type="buttons", showactive=False, y=1.15, x=1.0, xanchor="right",
            buttons=[dict(label="▶ Sweep around the orbit", method="animate",
                          args=[None, dict(frame=dict(duration=1200, redraw=True),
                                            fromcurrent=True, transition=dict(duration=300))]),
                     dict(label="⏸ Pause", method="animate",
                          args=[[None], dict(mode="immediate")])])],
        sliders=[dict(active=0, x=0.08, len=0.9,
            steps=[dict(method="animate", label=f"t={frac:.2f}T",
                        args=[[f"{k}"], dict(mode="immediate", frame=dict(redraw=True))])
                   for k, frac in enumerate(START_FRACTIONS)])],
    )
    return fig


show_fig(fig_kepler_areas())
```

The eccentric orbit above ($e=0.6$) makes the point vividly: near perihelion the planet is
moving fast and the sector is short and fat; near aphelion it crawls and the sector is long
and thin. The swept area comes out equal to four decimal places every time — not because
the orbit is an ellipse, but because $\phi$ was cyclic. Any central force at all would give
the same equal-area law; only the *shape* of the orbit depends on the specific $V(\rho)$.

The same argument in three dimensions, using spherical polar coordinates $(r,\theta,\phi)$
for a central potential $V(r)$,

$$
L = \tfrac12 m\big(\dot r^2 + r^2\dot\theta^2 + r^2\sin^2\theta\,\dot\phi^2\big) - V(r),
$$

again finds $\phi$ cyclic, giving $p_\phi = mr^2\sin^2\theta\,\dot\phi$ — now just the
*azimuthal component* of a full three-component angular momentum vector, whose other
conservation laws are present but no longer visible as simply as "coordinate absent from
$L$." Three constants of the motion (energy, $p_\phi$, and the total angular momentum
squared) turn out to be enough to solve the $2n=6$-dimensional problem completely — and,
looking ahead, these are exactly the constants of the motion that become the principal,
orbital-angular-momentum, and magnetic quantum numbers labeling hydrogen-atom states in
quantum mechanics.

## Where this is headed

Two threads from these two lectures both point toward the same destination. The conjugate
momentum $p_j = \partial L/\partial \dot q_j$, introduced here almost in passing for cyclic
coordinates, is about to become a dynamical variable in its own right, on equal footing with
$q_j$. And the freedom to shift $L$ by a total time derivative without touching the physics
— forced on this course by gauge invariance, but true of every Lagrangian system — turns
out to be the Lagrangian shadow of the **canonical transformations** that structure the
Hamiltonian formalism. Both threads are picked up directly once position and velocity give
way to position and momentum as the basic variables of motion.
