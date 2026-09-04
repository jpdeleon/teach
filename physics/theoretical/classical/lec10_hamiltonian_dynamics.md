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

# Lecture 10–12 — Hamiltonian Dynamics: Legendre Transforms, Poisson Brackets, and Integrability

*Source: [NPTEL Classical Physics, Mod-01 Lec-10](https://www.youtube.com/watch?v=GOkZs2RZMQY&list=PL5E4E56893588CBA8&index=11),
[Lec-11](https://www.youtube.com/watch?v=J1otrzmNBVQ&list=PL5E4E56893588CBA8&index=12), and
[Lec-12](https://www.youtube.com/watch?v=JCaJQrLRtEk&list=PL5E4E56893588CBA8&index=13)
(Hamiltonian dynamics, Parts 1–3), Prof. V. Balakrishnan.*

Two loose ends from [Lecture 8–9](lec08_electromagnetism.md) get picked up here and turn
out to be the same thread: the conjugate momentum $p_j = \partial L/\partial \dot q_j$
introduced almost in passing for cyclic coordinates becomes, in this lecture, a genuine
dynamical variable on equal footing with $q_j$; and the freedom to shift $L$ by a total
time derivative becomes the Lagrangian shadow of a much bigger idea, the **canonical
transformation**. Three lectures' worth of machinery — Legendre transforms, Hamilton's
equations, Poisson brackets, and the question of when a system can be solved at all —
builds toward one theorem that tells you exactly how far "solvability" reaches, and where
it runs out.

## The Legendre transform

A function $f(x)$ can be specified two ways: by its values, or — up to one additive
constant — by its *slope* at every point. Trading the first description for the second is
useful the moment there's more than one variable. For $f(x,y)$,

$$
df = \frac{\partial f}{\partial x}\,dx + \frac{\partial f}{\partial y}\,dy \equiv X\,dx + Y\,dy,
$$

and if $x$ is inconvenient to work with but its conjugate slope $X$ is natural, define

$$
g \equiv f - xX \quad\Longrightarrow\quad dg = df - x\,dX - X\,dx = -x\,dX + Y\,dy,
$$

so that $g$ is manifestly a function of $X$ and $y$ (having eliminated $x$ in favor of $X$
requires solving $X(x,y) = \partial f/\partial x$ for $x$ in terms of $X$ and $y$, and
substituting). This is the **Legendre transform**, and thermodynamics already runs on it:
$dU = T\,dS - P\,dV$ makes $U$ a function of $(S,V)$; trading $S$ for its conjugate $T$
gives the Helmholtz free energy $F \equiv U - TS$, with $dF = -S\,dT - P\,dV$, a function
of $(T,V)$; trading $V$ for $P$ gives the Gibbs free energy $G \equiv F + PV$, a function of
$(T,P)$. Which potential you use is dictated purely by which variables you can actually
control in the lab — the underlying physics doesn't change.

## From the Lagrangian to the Hamiltonian

Apply the same trick to $L(q,\dot q,t)$, trading each velocity $\dot q_i$ for its conjugate
slope, the momentum $p_i \equiv \partial L/\partial \dot q_i$ already met in [Lecture
8–9](lec08_electromagnetism.md). Define

$$
H(q,p,t) \equiv \sum_i \dot q_i\, p_i - L(q,\dot q,t)
$$

(the sign is chosen, not forced, purely so that $H$ comes out equal to the total energy in
the ordinary cases below). To make $H$ a genuine function of $q,p,t$ alone, every $\dot
q_i$ appearing on the right must be eliminated in favor of $p_i$ — solvable precisely when
the **Hessian** matrix $\partial^2 L/\partial \dot q_i \partial \dot q_j$ is non-singular,
so the defining relation $p_i(q,\dot q,t)$ can be inverted for $\dot q_i(q,p,t)$.

Taking the differential of both sides and comparing coefficients (the $p\,d\dot q$ term
cancels a matching term from $dL$ automatically, since $\partial L/\partial \dot q_i \equiv
p_i$ by definition) gives, once the Euler–Lagrange equations are used to identify $\partial
L/\partial q_i = \dot p_i$ on solution trajectories,

$$
\dot q_i = \frac{\partial H}{\partial p_i}, \qquad
\dot p_i = -\frac{\partial H}{\partial q_i}, \qquad
\frac{\partial H}{\partial t} = -\frac{\partial L}{\partial t}.
$$

These are **Hamilton's equations** — $2n$ genuinely first-order equations in place of $n$
second-order Euler–Lagrange equations, the direct payoff of trading $\dot q$ for $p$ as the
independent variable. The minus sign in $\dot p_i = -\partial H/\partial q_i$ is not
optional bookkeeping; it is, as will become clear almost immediately, doing essentially all
of the work in this formalism.

**Worked examples.** For $L = \sum_i \tfrac12 m_i\dot q_i^2 - V(q)$, $p_i = m_i\dot q_i$
inverts trivially and

$$
H(q,p) = \sum_i \frac{p_i^2}{2m_i} + V(q) = T + V,
$$

the total energy, expressed in momenta. For the charged particle of [Lecture
8–9](lec08_electromagnetism.md), $L = \tfrac12 mv^2 + q\vec A\cdot\vec v - q\phi$ gives $\vec
p = \partial L/\partial \vec v = m\vec v + q\vec A$ — the **canonical** momentum is *not*
$m\vec v$, it picks up an explicit, gauge-dependent piece from the field. Solving for $\vec
v = (\vec p - q\vec A)/m$ and substituting,

$$
H(\vec r,\vec p,t) = \frac{(\vec p - q\vec A)^2}{2m} + q\phi
$$

— the **minimal-coupling substitution** $\vec p \to \vec p - q\vec A$ applied to the
free-particle Hamiltonian, a pattern that survives essentially unchanged into quantum
mechanics.

## Constants of the motion and the Poisson bracket

If $H$ has no explicit time dependence, it's automatically conserved: with $\dot q =
\partial H/\partial p$ and $\dot p = -\partial H/\partial q$ substituted into $dH/dt =
\frac{\partial H}{\partial q}\dot q + \frac{\partial H}{\partial p}\dot p$, the two terms are
literally the same product with opposite sign, and cancel identically —

$$
\frac{dH}{dt} = \frac{\partial H}{\partial q}\frac{\partial H}{\partial p} - \frac{\partial H}{\partial p}\frac{\partial H}{\partial q} = 0.
$$

That minus sign from the Euler–Lagrange equations is exactly what makes this work. More
generally, for any function $F(q,p,t)$ evaluated along a solution trajectory, the same
substitution gives

$$
\frac{dF}{dt} = \underbrace{\sum_i\left(\frac{\partial F}{\partial q_i}\frac{\partial H}{\partial p_i} - \frac{\partial F}{\partial p_i}\frac{\partial H}{\partial q_i}\right)}_{\displaystyle \{F,H\}} + \frac{\partial F}{\partial t},
$$

defining the **Poisson bracket** $\{F,H\}$. $F$ is a constant of the motion if and only if
$\{F,H\} + \partial F/\partial t = 0$ — for time-independent $F$, simply $\{F,H\}=0$, said
to **Poisson-commute** with $H$, or to be **in involution** with it. Checking whether some
candidate quantity is conserved is now pure algebra: compute one bracket and see if it
vanishes.

The bracket obeys **antisymmetry** ($\{A,B\}=-\{B,A\}$), **bilinearity**, a **Leibniz**
(product) rule $\{A,BC\} = B\{A,C\} + \{A,B\}C$, and the **Jacobi identity**

$$
\{A,\{B,C\}\} + \{B,\{C,A\}\} + \{C,\{A,B\}\} = 0,
$$

a two-line check by direct expansion. Antisymmetry plus the Jacobi identity is precisely the
definition of a **Lie algebra** — the same algebraic structure carried by $n\times n$
matrices under the commutator $[A,B]=AB-BA$, or by ordinary 3-vectors under the cross
product. Functions on phase space, under the Poisson bracket, form a Lie algebra too, and
this is not a coincidence dressed up in similar language: it is the *classical* shadow of
the *quantum* commutator, made completely explicit by the canonical relations below.

## Symplectic structure

Stack the $2n$ phase-space variables into a single vector $\vec x = (q_1,\dots,q_n,p_1,\dots,p_n)$
and define the $2n\times 2n$ block matrix

$$
J = \begin{pmatrix} 0 & I \\ -I & 0 \end{pmatrix}, \qquad J^2 = -I, \qquad J^{-1} = -J = J^T.
$$

Hamilton's equations collapse into a single line, $\dot{\vec x} = J\,\nabla H$ — not quite a
gradient flow, but a *twisted* one, called the **symplectic gradient**, with the twist
supplied entirely by $J$. The Poisson bracket is exactly the corresponding twisted
("symplectic") dot product of two gradients, $\{A,B\} = (\nabla A)^T J (\nabla B)$; just as
an ordinary vanishing dot product of two ordinary gradients means two level surfaces meet at
right angles, $\{A,B\}=0$ means the level surfaces of $A$ and $B$ are orthogonal *in this
twisted, symplectic sense*. This is the reason Hamiltonian mechanics is often described as
the study of **symplectic geometry**.

Applying the bracket to the coordinates themselves, using only that $q$'s and $p$'s are
independent variables, gives the **canonical Poisson bracket relations**

$$
\{q_k,q_l\} = 0, \qquad \{p_k,p_l\} = 0, \qquad \{q_k,p_l\} = \delta_{kl},
$$

which is the formal statement that $q_k$ and $p_k$ form a **conjugate pair**: every
coordinate Poisson-commutes with every momentum except its own conjugate. This is the exact
classical precursor of $[\hat x,\hat p] = i\hbar$ in quantum mechanics — replace the Poisson
bracket with $\tfrac{1}{i\hbar}$ times the commutator and Hamiltonian mechanics becomes the
classical limit of the quantum theory almost mechanically.

## Extended phase space and time-dependent constants of the motion

A trajectory in ordinary $2n$-dimensional phase space needs $2n-1$ constants of the motion
to pin down as a curve; include time as an extra axis (**extended phase space**,
$2n+1$-dimensional) and a trajectory there needs $2n$ — one more, and it must be *explicitly
time-dependent*, since $2n$ purely time-independent constants would already have done the
job in the smaller, ordinary phase space.

The free particle makes this concrete: $H = p^2/2m$, with $q$ cyclic so $p$ is conserved —
one constant of the motion, tracing out a *plane* $p=\text{const}$ in extended $(q,p,t)$
space, not yet a line. Solving $\dot q = p/m$ with $p$ fixed gives $q(t) = q_0 + pt/m$, so

$$
F(q,p,t) = q - \frac{pt}{m}
$$

is a second, explicitly time-dependent constant — its two pieces of time dependence, the
explicit $-pt/m$ and the implicit dependence hiding in $q(t)$, cancel exactly. Checking this
algebraically: $\{q, p^2/2m\} = p/m$ (a short exercise using the Leibniz rule), so
$\{F,H\} + \partial F/\partial t = p/m - p/m = 0$, confirmed. Don't be surprised, in general,
to find conserved quantities that carry explicit time dependence — extended phase space
guarantees at least one always does.

## Liouville's theorem: Hamiltonian flow preserves volume

Treat $(q,p)$ as the "velocity field" of a generalized dynamical system, $\dot{\vec x} =
\vec f(\vec x)$ with $\vec f = (\partial H/\partial p, -\partial H/\partial q)$, and ask
whether the flow is conservative in the phase-space-volume sense from [Lecture
5–6](lec05_autonomous_dynamics.md): is $\nabla\cdot\vec f = 0$?

$$
\nabla\cdot\vec f = \sum_i\left(\frac{\partial^2 H}{\partial q_i\partial p_i} - \frac{\partial^2 H}{\partial p_i\partial q_i}\right) \equiv 0
$$

identically, since mixed partial derivatives commute — again, that minus sign doing the
work. **Every Hamiltonian flow is volume-preserving in phase space**, exactly like an
incompressible fluid: a blob of initial conditions can stretch, shear, and fold into
arbitrarily complicated shapes as it evolves, but its total phase-space volume never
changes. (The same conclusion survives even for a genuinely time-dependent $H$: comparing
the state one infinitesimal step $\delta t$ later to the state now, the Jacobian of that
change of variables works out to $1 + O(\delta t^2)$, so volume is preserved step by
infinitesimal step, hence along the whole trajectory.)

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import plotly.graph_objects as go
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


def pendulum_rhs(t, y):
    n = len(y) // 2
    theta, p = y[:n], y[n:]
    return np.concatenate([p, -np.sin(theta)])


THETA0, P0, BLOB_R = 0.0, 1.3, 0.35
N_PTS = 60
phi = np.linspace(0, 2 * np.pi, N_PTS, endpoint=False)
theta_init = THETA0 + BLOB_R * np.cos(phi)
p_init = P0 + BLOB_R * np.sin(phi)
y0 = np.concatenate([theta_init, p_init])


def shoelace_area(x, y):
    return 0.5 * abs(np.sum(x * np.roll(y, -1) - np.roll(x, -1) * y))


T_SNAPSHOTS = [0.0, 2.0, 4.0, 6.0, 8.0]
sol = solve_ivp(pendulum_rhs, [0, max(T_SNAPSHOTS)], y0, t_eval=T_SNAPSHOTS,
                 rtol=1e-10, atol=1e-10, max_step=0.01)
A0 = shoelace_area(theta_init, p_init)

theta_grid = np.linspace(-3.4, 3.4, 300)


def fig_liouville():
    th0 = np.concatenate([theta_init, [theta_init[0]]])
    pp0 = np.concatenate([p_init, [p_init[0]]])
    fig = go.Figure()
    for E in [-0.9, -0.6, -0.3, 0.0, 0.4, 0.8]:
        v2 = 2 * (E + np.cos(theta_grid))
        v = np.sqrt(np.where(v2 >= 0, v2, np.nan))
        fig.add_trace(go.Scatter(x=theta_grid, y=v, mode="lines",
                                  line=dict(color="rgba(70,130,180,0.2)", width=1),
                                  hoverinfo="skip", showlegend=False))
        fig.add_trace(go.Scatter(x=theta_grid, y=-v, mode="lines",
                                  line=dict(color="rgba(70,130,180,0.2)", width=1),
                                  hoverinfo="skip", showlegend=False))
    fig.add_trace(go.Scatter(x=th0, y=pp0, mode="lines", fill="toself",
                              fillcolor="rgba(178,34,34,0.45)",
                              line=dict(color="firebrick", width=1.5),
                              name="phase-space blob"))

    frames = []
    for k, t in enumerate(T_SNAPSHOTS):
        yt = sol.y[:, k]
        th, pp = yt[:N_PTS], yt[N_PTS:]
        th_c = np.concatenate([th, [th[0]]])
        pp_c = np.concatenate([pp, [pp[0]]])
        A = shoelace_area(th, pp)
        title = f"t = {t:.1f}:  area = {A:.4f}  (started at {A0:.4f}, ratio {A/A0:.4f})"
        frames.append(go.Frame(data=[go.Scatter(x=th_c, y=pp_c)], traces=[len(fig.data) - 1],
                                name=f"{k}", layout=dict(title=title)))
    fig.frames = frames

    fig.update_xaxes(title_text="θ", range=[-3.4, 3.4])
    fig.update_yaxes(title_text="p", range=[-2.2, 2.2])
    fig.update_layout(
        title=f"t = 0.0:  area = {A0:.4f}  (started at {A0:.4f}, ratio 1.0000)",
        width=760, height=480,
        updatemenus=[dict(type="buttons", showactive=False, y=1.2, x=1.0, xanchor="right",
            buttons=[dict(label="▶ Advect the blob", method="animate",
                          args=[None, dict(frame=dict(duration=1300, redraw=True),
                                            fromcurrent=True, transition=dict(duration=300))]),
                     dict(label="⏸ Pause", method="animate",
                          args=[[None], dict(mode="immediate")])])],
        sliders=[dict(active=0, x=0.08, len=0.9,
            steps=[dict(method="animate", label=f"t={t:.1f}",
                        args=[[f"{k}"], dict(mode="immediate", frame=dict(redraw=True))])
                   for k, t in enumerate(T_SNAPSHOTS)])],
    )
    return fig


show_fig(fig_liouville())
```

The blob is a small circle in $(\theta,p)$ at $t=0$; by $t=8$ it has visibly sheared into an
elongated, curved sliver — yet its area, recomputed at every frame, stays within a fraction
of a percent of where it started. The shearing itself is a signature of the pendulum's
*nonlinearity*: points on opposite edges of the blob sit on slightly different energy
contours, and since (unlike the harmonic oscillator) the pendulum's period genuinely depends
on amplitude, those points advance at different rates and the blob smears out along the
flow direction — all while Liouville's theorem keeps its area locked.

## Canonical transformations

The volume-preservation property is worth protecting when changing variables. A
transformation $(q,p) \to (Q,P)$ (possibly with $t$) is **canonical** if it preserves the
Jacobian determinant ($=+1$, volume *and* orientation preserving — $-1$ would preserve
volume but flip handedness, like a parity transformation) and if there exists some new
function $K(Q,P,t)$ for which Hamilton's equations keep their exact form,
$\dot Q_i = \partial K/\partial P_i$, $\dot P_i = -\partial K/\partial Q_i$. Equivalently
— and more usefully, since it says nothing about any particular Hamiltonian — a
transformation is canonical exactly when it preserves the canonical Poisson bracket
relations, $\{Q_i,Q_j\}=0=\{P_i,P_j\}$, $\{Q_i,P_j\}=\delta_{ij}$, for *every* system with
that many degrees of freedom.

The simplest nontrivial example, $Q=p$, $P=-q$, is entirely unhelpful for solving anything
— but it makes an important point vivid: the Jacobian determinant is exactly $+1$, the
bracket relations hold, and "coordinate" versus "momentum" turns out to be nothing more
than a labeling convention. Phase space genuinely has $2n$ variables in conjugate pairs
with a shared geometric structure; which half you call $q$ and which you call $p$ is
arbitrary.

The motivation for canonical transformations is exactly this: **find one that makes as many
of the new $Q$'s cyclic as possible**, since a cyclic $Q_i$ hands you an instant constant
of the motion, $P_i = \text{const}$.

## Liouville–Arnold integrability and action-angle variables

Push that idea as far as it goes. Suppose there exist $n$ **functionally independent**
constants of the motion $F_1,\dots,F_n$ (conveniently $F_1 \equiv H$), pairwise **in
involution**, $\{F_i,F_j\}=0$ for every $i,j$. Then — this is the **Liouville–Arnold
theorem**, an existence result, not a recipe — there exists a canonical transformation to
**action-angle variables** $(\theta_i, I_i)$ in which the new Hamiltonian depends on the
actions alone, $K = K(I_1,\dots,I_n)$. Hamilton's equations for this $K$ collapse
immediately:

$$
\dot I_i = -\frac{\partial K}{\partial \theta_i} = 0, \qquad
\dot\theta_i = \frac{\partial K}{\partial I_i} \equiv \omega_i(I) = \text{const},
$$

so $I_i(t) = \text{const}$ and $\theta_i(t) = \omega_i t + \theta_i(0)$ — the *entire*
problem, solved outright, the moment the theorem's hypothesis is met. It's an existence
theorem in the strongest sense: it doesn't tell you how to find the $F_i$'s, nor the
canonical transformation itself, only that both exist. (The Jacobi identity gives one
concrete tool for hunting: if $A$ and $B$ are both constants of the motion, so automatically
is $\{A,B\}$ — set $C=H$ in the Jacobi identity and every term but $\{H,\{A,B\}\}$ vanishes.
This is why, whenever two components of an angular momentum vector are separately
conserved, the third is guaranteed to be as well.)

Since each $\theta_i$ is an angle running from $0$ to $2\pi$, the phase space of a fully
integrable system is foliated by $n$-dimensional **tori**, one torus per fixed value of
$(I_1,\dots,I_n)$, with motion on each torus running at the constant angular velocities
$\omega_i(I)$.

**Worked example.** For the harmonic oscillator, $H=p^2/2m + \tfrac12 m\omega^2q^2$, the
change of variables $q = \sqrt{2I/m\omega}\,\sin\theta$, $p=\sqrt{2Im\omega}\,\cos\theta$
gives $H \to K(I) = I\omega$ — $\theta$ manifestly cyclic — and it's a short exercise to
verify $\{\theta,I\}=1$ and that the Jacobian of the transformation is exactly $1$, so it
qualifies as canonical. $I$ is the action, conserved outright; $\theta(t) = \omega t +
\theta_0$ is the angle, increasing linearly — using an enormous piece of machinery to solve
a problem that elementary methods handle in three lines, but showing exactly how the general
mechanism operates on a case simple enough to check by hand.

## A gallery of integrable — and non-integrable — systems

- **Any one-degree-of-freedom system** is integrable: $H(q,p)$ itself is the one required
  constant of the motion (trivially "in involution with itself"), and the phase portrait is
  just the family of curves $H=\text{const}$.
- **Separable systems**, $H = \sum_i H_i(q_i,p_i)$, are integrable for the same reason $n$
  separate one-dimensional problems are each individually solved: the $H_i$'s automatically
  Poisson-commute with each other, since $q_i,p_i$ only ever involve their own index.
- **A free particle in a square box** ($0\le x,y\le L$, elastic walls): neither $p_x$ nor
  $p_y$ is conserved (each flips sign at a wall), but $p_x^2$ and $p_y^2$ are, and they're
  in involution — integrable (with one asterisk: a trajectory shot exactly into a corner
  has no well-defined reflection, a measure-zero set of initial conditions excluded by
  convention).
- **A free particle in a circular billiard**: $H$ and the angular momentum $L = xp_y - yp_x$
  are conserved and in involution (the boundary has circular symmetry, so nothing breaks
  rotational invariance) — integrable, with every orbit confined between two concentric
  circles.
- **A free particle in an elliptical billiard**: no single center has full symmetry, but the
  *sum* of the angular momenta about the two foci is conserved — integrable again, by a
  less obvious constant of the motion.
- **A square billiard with a circular scatterer fixed at the center**: Cartesian symmetry
  from the outer walls conflicts with the circular symmetry of the obstacle, and neither
  survives as an exact symmetry of the whole system. This system is **not integrable** —
  it's chaotic. The mechanism is instructive: in an integrable system, two nearby
  trajectories only ever drift apart *linearly* in the angle variables (constant $\omega$'s,
  linear-in-time $\theta$'s), so small errors stay small. Here, a trajectory aimed a hair
  off dead-center at the obstacle diverges from its neighbor at every bounce, and the
  separation grows to system size in a finite number of reflections.
- **The Bunimovich stadium** (a circle sliced in half with a straight segment inserted, all
  its boundary concave or flat, *no* convex arcs anywhere) is chaotic too — proof that the
  naive "convex boundary defocuses, therefore chaos" intuition is incomplete; a
  *curvature discontinuity* at the join between flat and curved segments does the same
  defocusing job optically, without any convex mirror in sight.
- **A particle in a 3D central potential** $V(r)$: with $H = p_r^2/2m + L^2/2mr^2 + V(r)$,
  three degrees of freedom need three constants in involution. The three Cartesian
  components of $\vec L$ are each conserved but are *not* mutually in involution
  ($\{L_x,L_y\}=L_z \ne 0$, and cyclically) — but any *one* component, say $L_z$, together
  with $L^2$ (which commutes with every component) and $H$, gives exactly three independent,
  mutually-commuting constants. **Every** central-force problem in three dimensions is
  integrable, not only the inverse-square case (though $1/r$ and $r^2$ potentials carry
  *extra* symmetry beyond this, with correspondingly extra-special orbits).
- **Two bodies interacting only through $V(|\vec r_1-\vec r_2|)$** reduce, via center-of-mass
  and relative coordinates, to a free particle (the center of mass, immediately solved
  outright) plus a central-force problem in the relative coordinate (just solved above) —
  integrable, six degrees of freedom fully accounted for.
- **The $N$-body problem** with pairwise central forces has, in general, only the
  "Galilean" constants of the motion: $H$ (1), total angular momentum $\vec L$ (3), total
  momentum $\vec P$ (3), and the time-dependent centers-of-mass constants $\vec
  R_{\rm cm}(0) = \vec R_{\rm cm}(t) - \vec P t/M$ (3 more) — ten in total, independent of
  $N$. Even for $N=3$ that's already short of the $3N=9$ constants *in involution* needed
  (the three components of $\vec L$ don't Poisson-commute with each other, so at most one
  of them counts toward the tally) — the **three-body problem is generically not
  integrable**. This is one honest reason statistical mechanics is unavoidable: it isn't
  only that $10^{23}$ particles is too many equations to write down, it's that even three
  interacting bodies already fail to be solvable in closed form.

## Two oscillators, Lissajous figures, and quasi-periodicity

Two uncoupled harmonic oscillators, $H = H_1(q_1,p_1) + H_2(q_2,p_2)$, are trivially
integrable — separable, per the gallery above — and go to action-angle variables
$(\theta_1,I_1),(\theta_2,I_2)$ independently, tracing out a 2-torus. What the trajectory
looks like projected onto the $(q_1,q_2)$ plane depends entirely on the ratio $\omega_1/\omega_2$:

```{code-cell} ipython3
:tags: [hide-input]

GOLDEN_RATIO_CONJ = (np.sqrt(5) - 1) / 2

CASES2 = [
    dict(name="ω₁:ω₂ = 1:1  (closes after one loop)", w1=1.0, w2=1.0, T=30, n=3000),
    dict(name="ω₁:ω₂ = 2:3  (commensurate — closes after 3 loops)", w1=2.0, w2=3.0, T=30, n=6000),
    dict(name="ω₁:ω₂ = golden ratio  (incommensurate — never closes)",
         w1=1.0, w2=GOLDEN_RATIO_CONJ, T=4000, n=40000),
]


def lissajous(w1, w2, T, n, phi=0.4):
    t = np.linspace(0, T, n)
    return np.cos(w1 * t), np.cos(w2 * t + phi)


def fig_lissajous():
    q1_0, q2_0 = lissajous(**{k: v for k, v in CASES2[0].items() if k != "name"})
    fig = go.Figure()
    fig.add_trace(go.Scatter(x=q1_0, y=q2_0, mode="lines",
                              line=dict(color="steelblue", width=1.3), name="(q₁, q₂)"))

    frames = []
    for k, c in enumerate(CASES2):
        q1, q2 = lissajous(c["w1"], c["w2"], c["T"], c["n"])
        frames.append(go.Frame(data=[go.Scatter(x=q1, y=q2)], traces=[0],
                                name=f"{k}", layout=dict(title=c["name"])))
    fig.frames = frames

    fig.update_xaxes(title_text="q₁", range=[-1.15, 1.15])
    fig.update_yaxes(title_text="q₂", range=[-1.15, 1.15], scaleanchor="x", scaleratio=1)
    fig.update_layout(
        title=CASES2[0]["name"], width=620, height=560,
        updatemenus=[dict(type="buttons", showactive=False, y=1.15, x=1.0, xanchor="right",
            buttons=[dict(label="▶ Change the ratio", method="animate",
                          args=[None, dict(frame=dict(duration=1800, redraw=True),
                                            fromcurrent=True, transition=dict(duration=300))]),
                     dict(label="⏸ Pause", method="animate",
                          args=[[None], dict(mode="immediate")])])],
        sliders=[dict(active=0, x=0.08, len=0.9,
            steps=[dict(method="animate", label=c["name"].split("  ")[0],
                        args=[[f"{k}"], dict(mode="immediate", frame=dict(redraw=True))])
                   for k, c in enumerate(CASES2)])],
    )
    return fig


show_fig(fig_lissajous())
```

When $\omega_1/\omega_2$ is **rational**, $r\omega_1 = s\omega_2$ for integers $r,s$, the
curve closes on itself after a finite number of loops — genuinely periodic motion. When it's
**irrational**, the trajectory never returns to its starting point and, given enough time,
sweeps out the entire rectangle densely — **quasi-periodic** motion. Slicing the
golden-ratio torus with a Poincaré section reduces the whole story to the map $\theta_{n+1}
= \theta_n + \omega \pmod 1$ for irrational $\omega$: a classical equidistribution theorem
(Weyl) guarantees the iterates fill the circle uniformly, visiting arbitrarily close to
every point infinitely often — the system is **ergodic** on that one-dimensional slice,
and, by extension, on the torus itself. (Numerically, "irrational" always means "rational to
machine precision" — the practical fix is to pick a ratio that resists rational
approximation for as long as possible, and $(\sqrt5-1)/2$, the golden ratio's reciprocal,
is famously the hardest number of all to approximate well by fractions with small
denominators, for reasons that trace back to its continued-fraction expansion.)

The key structural difference from the single harmonic oscillator is that, in general, the
frequencies $\omega_i(I)$ *depend on the actions* — unlike the oscillator, where the period
is amplitude-independent. Bounded motion in a fully integrable system is, generically,
quasi-periodic on an invariant torus rather than strictly periodic, and what happens to
those tori once a system stops being exactly integrable — whether they survive, deform, or
dissolve into the chaotic layers glimpsed in the billiard examples above — is exactly the
question [Lecture 5–6](lec05_autonomous_dynamics.md)'s promise of chaos beyond two
dimensions was pointing toward, and where the course picks the thread back up.
