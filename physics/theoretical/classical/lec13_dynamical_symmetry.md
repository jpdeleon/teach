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

# Lecture 13–14 — Dynamical Symmetry: Noether's Theorem, the Symplectic Group, and the Kepler Problem

*Source: [NPTEL Classical Physics, Mod-01 Lec-13](https://www.youtube.com/watch?v=sD8WSHyUvkA&list=PL5E4E56893588CBA8&index=13)
and [Lec-14](https://www.youtube.com/watch?v=7a8HIqast00&list=PL5E4E56893588CBA8&index=15)
(Dynamical symmetry, Parts 1–2), Prof. V. Balakrishnan.*

[Lecture 10–12](lec10_hamiltonian_dynamics.md) left the words "symmetry," "invariance," and
"conservation" doing a lot of unexamined work — rotational symmetry gives conserved angular
momentum, translational symmetry gives conserved linear momentum, and it was left at the
level of familiar special cases. This lecture makes the relationship precise (Noether's
theorem), then asks the sharper question those examples were hiding: given a Hamiltonian,
what is *the entire group* of transformations that preserves it, and how large is that group
really? The two-dimensional isotropic oscillator and the Kepler problem turn out to hide
symmetry groups — $SU(2)$ and $SO(4)$ — much bigger than "rotational symmetry" would suggest,
and that extra size is exactly what produces the "accidental" degeneracy of the hydrogen atom
in quantum mechanics.

## Noether's theorem in the Lagrangian framework

Formalize what "symmetry" means before relating it to anything else. Consider a continuous,
one-parameter family of coordinate changes $q \to Q(\alpha)$, with $Q(0) = q$ the identity
transformation, and write the Lagrangian evaluated along the transformed coordinates as
$L' \equiv L\big(Q(\alpha), \dot Q(\alpha)\big)$. The transformation is a symmetry if $L'=L$
for every $\alpha$ — not merely at $\alpha=0$ — i.e. if

$$
\frac{dL'}{d\alpha} = \frac{\partial L}{\partial Q_i}\frac{dQ_i}{d\alpha}
                     + \frac{\partial L}{\partial \dot Q_i}\frac{d\dot Q_i}{d\alpha} = 0.
$$

Since $\alpha$ parameterizes a change of coordinates and has nothing to do with $t$, the
derivative and $d/d\alpha$ commute: $d\dot Q_i/d\alpha = d/dt\,(dQ_i/d\alpha)$. Using the
Euler–Lagrange equations $\partial L/\partial Q_i = \frac{d}{dt}\partial L/\partial \dot Q_i$
turns the first term into a total time derivative too, and the whole expression collapses to

$$
0 = \frac{d}{dt}\left(\frac{\partial L}{\partial \dot Q_i}\frac{dQ_i}{d\alpha}\right)
\quad\Longrightarrow\quad
p_i \frac{\partial Q_i}{\partial \alpha}\bigg|_{\alpha=0} = \text{const}.
$$

This is **Noether's theorem**: every continuous symmetry of $L$ hands over one conserved
quantity, built from the momentum dotted into the *direction* the symmetry moves each
coordinate. Rotating $q_1, q_2$ by an angle $\alpha$ leaves a central potential
$V(q_1^2+q_2^2)$ invariant for every $\alpha$, and the theorem's recipe reproduces angular
momentum; shifting the origin reproduces linear momentum; shifting the origin of time (an
invariance of the equations of motion, not literally of this derivation's $\alpha$-family)
reproduces the Hamiltonian itself. The theorem generalizes twice: to several parameters at
once (three rotation angles give three conserved angular-momentum components), and to
symmetries where $L$ is invariant only up to a total time derivative,
$L' - L = df/dt$ — since [adding $df/dt$ to a Lagrangian never changes the equations of
motion](lec07_lagrangian.md), this is already the most general notion of invariance the
formalism admits, and it is exactly how gauge invariance of the electromagnetic field
[hands over conservation of charge](lec08_electromagnetism.md). What is essential throughout
is that the transformations be **continuous** and connected to the identity — parity (a
right-handed frame flipping to a left-handed one) cannot be reached by any continuous
$\alpha$-family, so it sits outside what Noether's theorem can say anything about.

## Dynamical symmetry in the Hamiltonian framework: the symplectic group

The Hamiltonian version sharpens this considerably, because it separates two conditions that
the Lagrangian derivation runs together. A transformation $(q,p) \to (Q,P)$ that is going to
qualify as a **dynamical symmetry** must first be a [canonical
transformation](lec10_hamiltonian_dynamics.md) — otherwise Hamilton's equations don't even
keep their form — *and* it must leave the Hamiltonian's functional form unchanged, $K=H$, so
that the transformed trajectories really are solutions of the same physical system rather
than of some other one. The first condition alone is already a rich, well-defined group; the
second cuts out a subgroup of it.

Recall $J = \begin{pmatrix}0 & I\\ -I & 0\end{pmatrix}$ from Lecture 10–12, with
$J^2=-I$. Stacking $q$'s and $p$'s into $\vec x$ and writing the Jacobian of a transformation
as $M \equiv \partial \vec X/\partial \vec x$, the canonical Poisson-bracket relations
$\{X_i,X_j\}=J_{ij}$ translate directly into a matrix condition on $M$:

$$
M^T J M = J.
$$

Any matrix satisfying this is called **symplectic**. It is the direct analog of the
orthogonality condition $R^TR=I$ that defines a rotation — $J$ plays the role of the metric,
so this is "orthogonality with respect to $J$" rather than the ordinary Euclidean one. Every
symplectic matrix is automatically invertible (its inverse is built from $M^T$ exactly as an
orthogonal matrix's inverse is its transpose, just with $J$'s inserted), and the product of
two symplectic matrices is again symplectic — canonical transformations compose into a single
canonical transformation, exactly as expected. The set of all $2n\times 2n$ real symplectic
matrices therefore forms a group, denoted $Sp(2n,\mathbb R)$: **the group of canonical
transformations for an $n$-degree-of-freedom system.**

**Counting parameters.** Write an infinitesimal canonical transformation as
$M = I + \epsilon G$ for a small parameter $\epsilon$ and a matrix $G$ called the
**generator**. Substituting into $M^TJM=J$ and keeping only first order in $\epsilon$ gives

$$
G^T J = -JG,
$$

the infinitesimal (linearized) version of the symplectic condition. Counting independent
solutions $G$ of this equation gives the number of generators — the dimension of the group —
and the count for $Sp(2n,\mathbb R)$ works out to $n(2n+1)$, i.e. $2n^2+n$. This is worth
comparing to the familiar rotation group: $SO(n)$, the group of $n\times n$ real orthogonal
matrices with determinant $+1$, has $\tfrac12 n(n-1)$ generators — one per independent
coordinate plane a rotation can act in, which is why $n$ Euclidean dimensions carry $n$
mutually orthogonal rotation planes only when $n=3$ (the unique integer solution of
$\tfrac12n(n-1)=n$, the reason "rotation about an axis" is even a sensible phrase only in
three dimensions; in general, a rotation is defined by *homogeneous, orthogonal,
unimodular* — never by an axis). $U(n)$, the unitary $n\times n$ matrices, has $n^2$
generators, and its determinant-one subgroup $SU(n)$ has $n^2-1$.

The simplest nontrivial symplectic matrix is $M=J$ itself, generating exactly the
$Q=p,\,P=-q$ swap [met in Lecture 10–12](lec10_hamiltonian_dynamics.md) — a canonical
transformation, but not a symmetry of any particular $H$ unless $H$ itself happens to be
invariant under it. That is the crux of the whole lecture: **canonical transformations that
leave $H$ unchanged form a subgroup of $Sp(2n,\mathbb R)$, and finding that subgroup for a
given Hamiltonian is, in general, hard** — nothing here hands it to you the way Noether's
recipe hands you a conserved quantity from a symmetry you already knew about.

## Worked example: the 2D isotropic oscillator and $SU(2)$

Take two decoupled oscillators of equal frequency, in units where $m=\omega=1$:

$$
H(q_1,q_2,p_1,p_2) = \tfrac12\left(q_1^2+p_1^2+q_2^2+p_2^2\right).
$$

This is [separable and hence integrable](lec10_hamiltonian_dynamics.md), with
$F_1=\tfrac12(q_1^2+p_1^2)$ and $F_2=\tfrac12(q_2^2+p_2^2)$ constant and in involution, and
equal frequencies make every orbit periodic. But $H$ has more structure than "two
independent oscillators" suggests: it is literally the sum of the squares of all four
phase-space coordinates, so *any* rotation of $(q_1,q_2,p_1,p_2)$ as four real numbers in
$\mathbb R^4$ — mixing coordinates and momenta freely, not just rotating $q_1,q_2$ into each
other in physical space — leaves $H$ exactly unchanged. That symmetry group is $SO(4)$, with
$\tfrac12\cdot4\cdot3=6$ generators, while the canonical transformations available for a
two-degree-of-freedom system form $Sp(4,\mathbb R)$, with $2(2)^2+2=10$ generators. These are
different groups — an $SO(4)$ rotation need not be canonical, and a canonical transformation
need not preserve $H$ — so the dynamical symmetry group of the isotropic oscillator is
neither of them individually, but their intersection,

$$
Sp(4,\mathbb R)\;\cap\;SO(4) \;\cong\; SU(2),
$$

isomorphic to the group of $2\times2$ unitary matrices with unit determinant. A general
element of $SU(2)$ can always be written $\begin{pmatrix}\alpha&\beta\\-\beta^*&\alpha^*
\end{pmatrix}$ with $|\alpha|^2+|\beta|^2=1$; writing $\alpha,\beta$ in terms of four real
numbers, this constraint is exactly the equation of the unit sphere $S^3$ sitting inside
$\mathbb R^4$ — the **parameter space** of $SU(2)$ is a three-sphere. Counting generators
directly, $U(2)$ has $2^2=4$, and fixing $\det=1$ removes one, leaving $3 = 2^2-1$, matching
the general count $n^2-1$ for $SU(n)$.

The three generators of this $SU(2)$ turn out to be

$$
J_1 = \tfrac14\left(q_1^2+p_1^2-q_2^2-p_2^2\right), \qquad
J_2 = \tfrac12\left(q_1q_2+p_1p_2\right), \qquad
J_3 = \tfrac12\left(q_1p_2-q_2p_1\right),
$$

each a constant of the motion — $\{J_i,H\}=0$ for all three — but, unlike $F_1,F_2$, **not**
mutually in involution:

$$
\{J_i,J_j\} = \epsilon_{ijk}J_k,
$$

the same Lie algebra as angular momentum (or, equivalently, as the Pauli matrices under
$\tfrac1{2i}$ times the commutator). This is the general lesson: a two-degree-of-freedom
system has phase space of dimension four, so at most three functionally independent
time-independent constants of the motion exist, and integrability only asks for two of them
to be *in involution*. $J_1,J_2,J_3$ (together with $H$, and with $F_1-F_2$ expressible as a
combination of them) are extra constants beyond what integrability strictly requires — their
existence, and their non-commuting algebra, is precisely the fingerprint of the *dynamical*
symmetry sitting on top of plain integrability. The Jacobi identity guarantees that whenever
two components of such a vector are conserved, so is the third automatically — the same
mechanism that makes all three components of ordinary angular momentum conserved together for
any central force.

The three-dimensional isotropic oscillator repeats the pattern one dimension up: its
canonical transformations live in $Sp(6,\mathbb R)$, and the analogous symmetry-plus-canonical
subgroup is $SU(3)$, with $3^2-1=8$ generators — eight constants of the motion, obeying the
$SU(3)$ algebra, that are not required by integrability alone (three degrees of freedom needs
only three constants in involution) but are forced by the extra spherical symmetry of the
$r^2$ potential.

## The Kepler problem: the Laplace–Runge–Lenz vector and $SO(4)$

Now the physically important case, $H = \dfrac{p^2}{2m} - \dfrac{k}{r}$. As [any central-force
problem](lec10_hamiltonian_dynamics.md), it is integrable via $H$, $L^2$, and one component of
$\vec L$ (say $L_z$) — three independent, mutually commuting constants, since $\vec L$'s three
Cartesian components are each separately conserved but not in involution with each other,
$\{L_i,L_j\}=\epsilon_{ijk}L_k$. What is special to the exact $1/r$ potential — not $1/r^2$,
not $r^2$, nothing else — is a further conserved vector, the **Laplace–Runge–Lenz vector**

$$
\vec A \equiv \vec p \times \vec L - mk\,\hat r.
$$

Differentiating along a trajectory, using $\dot{\vec p} = -\nabla V = -\dfrac{k}{r^2}\hat r$
(the actual force), $\dot{\vec L}=0$, and the vector identity
$\vec a\times(\vec b\times\vec c) = (\vec a\cdot\vec c)\vec b - (\vec a\cdot\vec b)\vec c$
applied to $\dot{\vec p}\times\vec L$, every term cancels exactly:

$$
\frac{d\vec A}{dt}
= \underbrace{-\frac{k}{r^3}\Big[(\vec r\cdot\vec p)\vec r - r^2\vec p\Big]}_{\dot{\vec p}\times\vec L}
+ mk\left(\frac{\dot r}{r^2}\vec r - \frac{1}{r}\dot{\vec r}\right) = 0,
$$

using $\vec r\cdot\dot{\vec r} = r\dot r$ to simplify the last piece. The cancellation depends
on the force being *exactly* $1/r^2$ — nothing else makes it work. $\vec A$ is constant in
both magnitude and direction, it lies in the orbital plane (since it's built from $\vec r$ and
$\vec p$, both perpendicular to $\vec L$), and it points along the ellipse's major axis. That
constancy is the deep reason bound Kepler orbits are **exactly closed ellipses that never
precess**: any departure from a pure $1/r$ force — a $1/r^2$ correction from general
relativity, a perturbing planet, tidal effects — spoils the exact cancellation above and lets
the orbit precess (Mercury precesses about $43''$ per century from general relativity alone,
against $\sim 500''$ per century from ordinary planetary perturbations; some binary pulsars,
with far larger masses and tighter orbits, precess by several degrees per revolution).

Counting constants of the motion now looks like an embarrassment of riches — $H$ (1), $\vec L$
(3), $\vec A$ (3) — seven numbers in a six-dimensional phase space, so they cannot all be
independent. Indeed $\vec A\cdot\vec L=0$ (removing one component: $\vec A$ lies entirely in
the plane $\vec L$ is normal to) and

$$
A^2 = m^2k^2 + 2mHL^2,
$$

so $A$'s magnitude is fixed once $H$ and $L^2$ are known. The genuinely new content is
*directional*: $\vec A$'s constant direction, unlike $\vec L$'s, is not forced by rotational
symmetry of the potential alone — a generic central potential $V(r)$ conserves $\vec L$ but
lets its ellipse-analog precess freely. Suitably rescaled combinations $\vec A \pm \vec L$
close into two decoupled angular-momentum-like algebras, together isomorphic to the algebra
of rotations in *four* dimensions — the dynamical symmetry group of the Kepler problem (for
bound, $E<0$ orbits) is

$$
SO(4),
$$

with $\tfrac12\cdot4\cdot3=6$ generators: the three components of $\vec L$ plus three
independent combinations built from $\vec A$. Exactly as for the oscillator, this is *larger*
than what rotational symmetry in ordinary 3-space alone would suggest — the extra generators
mix "position-like" and "momentum-like" combinations, invisible to any transformation acting
on $\vec r$ alone. This is also why the Kepler and isotropic-oscillator potentials are the
**only** two central potentials for which every bounded orbit is exactly closed: they are
exactly the two potentials whose dynamical symmetry group is strictly bigger than the $SO(3)$
that any central force gets for free.

## From classical symmetry to quantum degeneracy

Classical dynamical symmetry translates directly into quantum-mechanical degeneracy: whatever
set of transformations leaves the energy unchanged relates states with the *same* energy but
different quantum numbers. For a generic central potential, the energy depends on the
principal and orbital quantum numbers $n,\ell$ but not on the magnetic quantum number $m$
(the ordinary $SO(3)$ rotational degeneracy), giving $2\ell+1$ states per $(n,\ell)$. The
hydrogen atom's spectrum has *more* degeneracy than this — the energy depends on $n$ alone,
not on $\ell$ — and summing the ordinary degeneracy over every allowed $\ell$,

$$
\sum_{\ell=0}^{n-1}(2\ell+1) = n^2, \qquad \text{times 2 for electron spin} \;\to\; 2n^2,
$$

reproduces the textbook hydrogen degeneracy exactly. This "accidental" degeneracy is not
accidental at all: it is the direct quantum shadow of the classical $SO(4)$ symmetry generated
by $\vec L$ and $\vec A$ together, and it is lifted the instant the potential departs from
pure $1/r$ — which is exactly why the fine-structure correction (among other effects) splits
the hydrogen $2s$ and $2p$ levels that a strict $1/r$ potential could never tell apart.

## Interlude: the bead on a rotating hoop

Switching from symmetry to a worked exercise in the Lagrangian–Hamiltonian toolkit together:
a bead of mass $m$ slides frictionlessly on a vertical circular hoop of radius $R$, and the
whole hoop is spun about its vertical diameter at constant angular speed $\omega$. Using the
angle $\theta$ from the bottom of the hoop, the bead's position is
$\rho = R\sin\theta$ (distance from the spin axis), $z=R(1-\cos\theta)$, and with the rotation
$\dot\varphi=\omega$ imposed as a constraint *before* varying, the kinetic energy collects a
term $\tfrac12 m\rho^2\omega^2 = \tfrac12 mR^2\omega^2\sin^2\theta$ that carries no
$\dot\theta$ at all — it lands in the Lagrangian with the sign of a kinetic term, but behaves
exactly like an *inverted* potential, pushing the bead away from the axis. This is the
**centrifugal term**, appearing automatically, with no extra bookkeeping, simply because the
constraint was substituted into $L$ directly — the same trick [Lecture
7](lec07_lagrangian.md) used to eliminate the string tension in the Atwood machine.

The reduced, one-degree-of-freedom Lagrangian and its Hamiltonian (with $p$ the momentum
conjugate to $\rho$) are

$$
L(\rho,\dot\rho) = \frac{mR^2}{2(R^2-\rho^2)}\dot\rho^2 + \frac12 m\omega^2\rho^2
                    - mg\Big(R-\sqrt{R^2-\rho^2}\Big),
$$

$$
H(\rho,p) = \frac{p^2(R^2-\rho^2)}{2mR^2} - \frac12 m\omega^2\rho^2
                    + mg\Big(R-\sqrt{R^2-\rho^2}\Big),
$$

and Hamilton's equations give $\dot\rho = p(R^2-\rho^2)/mR^2$ and

$$
\dot p = \rho\left[\frac{p^2}{mR^2} + m\omega^2 - \frac{mg}{\sqrt{R^2-\rho^2}}\right].
$$

Critical points need $\dot\rho=0$, forcing $p=0$ (away from the singular endpoint
$\rho=R$), and then $\dot p=0$ requires either $\rho=0$ — the bottom of the hoop, always an
equilibrium — or $\sqrt{R^2-\rho^2} = g/\omega^2$, which has a real solution only when
$\omega$ exceeds a threshold $\omega_c = \sqrt{g/R}$:

$$
\rho_{\rm eq}(\omega) = R\sqrt{1 - \left(\frac{\omega_c}{\omega}\right)^{4}}, \qquad \omega>\omega_c.
$$

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


w_over_wc = np.linspace(0.0, 2.2, 400)

# Origin branch: stable for w < wc, unstable for w > wc.
origin_stable = np.where(w_over_wc <= 1.0, 0.0, np.nan)
origin_unstable = np.where(w_over_wc >= 1.0, 0.0, np.nan)

# Off-origin branch exists (and is stable) only for w > wc.
w_branch = w_over_wc[w_over_wc >= 1.0]
rho_branch = np.sqrt(np.clip(1.0 - w_branch ** -4, 0.0, None))


def fig_pitchfork():
    fig = go.Figure()
    fig.add_trace(go.Scatter(x=w_over_wc, y=origin_stable, mode="lines",
                              line=dict(color="steelblue", width=3),
                              name="ρ = 0 (stable)"))
    fig.add_trace(go.Scatter(x=w_over_wc, y=origin_unstable, mode="lines",
                              line=dict(color="firebrick", width=2, dash="dash"),
                              name="ρ = 0 (unstable)"))
    fig.add_trace(go.Scatter(x=w_branch, y=rho_branch, mode="lines",
                              line=dict(color="steelblue", width=3),
                              name="ρ_eq(ω) (stable)"))
    fig.add_vline(x=1.0, line=dict(color="gray", dash="dot"),
                  annotation_text="ω = ω_c = √(g/R)")
    fig.update_xaxes(title_text="ω / ω_c")
    fig.update_yaxes(title_text="ρ_eq / R", range=[-0.05, 1.05])
    fig.update_layout(title="Pitchfork bifurcation of the bead-on-a-rotating-hoop equilibrium",
                       width=700, height=460)
    return fig


show_fig(fig_pitchfork())
```

Below the threshold, the bottom of the hoop is the only equilibrium, and it is stable
(gravity always wins). Above it, that same equilibrium goes unstable and a new stable
equilibrium branches off with a **square-root singularity** — $\rho_{\rm eq}$ rises from zero
with infinite slope right at $\omega_c$ and saturates toward $R$ as $\omega\to\infty$, matching
the physical expectation that a very fast spin pins the bead near the rim. This is a
**pitchfork bifurcation** in the sense of [Lecture
5–6](lec05_autonomous_dynamics.md)'s classification of how equilibria are born, destroyed, or
exchange stability as a parameter is varied — reached here not by studying an abstract
one-dimensional flow, but by carrying a constrained mechanical system all the way from the
Lagrangian, through the Hamiltonian, to a stability analysis of its own critical points, which
is exactly the combination of tools the last several lectures were assembling piece by piece.
