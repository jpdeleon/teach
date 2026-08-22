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

# Lecture 1 — Orders of Magnitude and the Regimes of Physics

*Source: [NPTEL Classical Physics, Mod-01 Lec-01](https://www.youtube.com/watch?v=Q6Gw08pwhws&list=PL5E4E56893588CBA8&index=1), Prof. V. Balakrishnan.*

## What can you perceive with your bare senses?

Before any instrument, any mathematics, any physics — just holding, looking, waiting —
how much of mass, length, and time can you actually judge? Pushed to estimate, the
answers converge on the same few orders of magnitude:

| Quantity | Smallest judgable | Largest judgable | Span |
|---|---|---|---|
| Mass | $\sim 10^{-4}\,\text{kg}$ (a fraction of a gram) | $\sim 10^{3}\,\text{kg}$ (what you can push) | 7 decades |
| Length | $\sim 10^{-4}\,\text{m}$ (sharp naked-eye resolution) | $\sim 10^{4}\,\text{m}$ (a clear mountain-top view) | 8 decades |
| Time | $\sim 10^{-1}\,\text{s}$ (an eye-blink) | $\sim 10^{7}\,\text{s}$ (~100 days, past which circadian cues fail entirely) | 8 decades |

That upper time bound isn't a guess: sensory-deprivation experiments — constant light,
featureless food, no clocks — show that after a couple of months even the *body's own*
rhythms drift, until a subject's sense of "a day" stretches to 50 hours. Strip away
every external cue and human time perception simply stops being reliable beyond
about $10^7$ seconds.

This is the **world of middle dimensions**: the narrow, roughly 7–8 decade window our
senses evolved to resolve, because that was all survival ever required. A fraction of
a second was enough reflex time to not fall out of a tree; the difference between a
gram and a kilogram was enough to know a thrown rock from a thrown leaf. There was
never evolutionary pressure to tell a picosecond from a nanosecond, so we simply can't.

## The range nature actually operates on

Instruments break the walls of the middle dimensions on both sides at once —
microscopes inward, telescopes outward — and the numbers involved make the point
vividly:

| Quantity | Smallest known | Largest known | Span |
|---|---|---|---|
| Mass | electron, $\sim 10^{-30}\,\text{kg}$ | observable universe (Fermi estimate: $10^{11}$ galaxies $\times\,10^{11}$ stars/galaxy $\times\,10^{30}\,\text{kg}$), $\sim 10^{52}\,\text{kg}$ | 82 decades |
| Length | Planck length, $\sim 10^{-35}\,\text{m}$ | radius of the observable universe ($\sim$13.8-billion-year age $\times\,c$), $\sim 10^{26}\,\text{m}$ | 61 decades |
| Time | Planck time, $\sim 10^{-42}\,\text{s}$ | age of the universe, $\sim 10^{17}\,\text{s}$ | 59 decades |

(An atomic nucleus, $\sim 10^{-15}\,\text{m}$, sits well inside this length range — it's
where ordinary nuclear physics operates, still 20 decades short of the Planck length
where the real floor is.)

Our senses cover 7–8 decades. Nature's actual range, as far as we can currently probe
it, is **60 to 80+ decades** — and every one of those decades is a *multiplicative*
factor of ten, not an increment. There is no reason whatsoever to expect the
intuitions hard-wired for the middle-dimension sliver to extrapolate into that range —
and, as the rest of this course will keep demonstrating, they don't.

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
    return HTML(fig.to_html(full_html=False, include_mathjax=False,
                             config={"responsive": True}))

# (name, value, is the "unaided human range" band?)
categories = {
    "Mass (kg)": {
        "human_range": (1e-4, 1e3),
        "points": [
            ("electron", 9.1e-31),
            ("Planck mass (not a lower bound - see below)", 2.18e-8),
            ("Sun", 2.0e30),
            ("observable universe (Fermi estimate)", 1e52),
        ],
    },
    "Length (m)": {
        "human_range": (1e-4, 1e4),
        "points": [
            ("Planck length", 1.6e-35),
            ("atomic nucleus", 1e-15),
            ("radius of observable universe", 4e26),
        ],
    },
    "Time (s)": {
        "human_range": (1e-1, 1e7),
        "points": [
            ("Planck time", 5.4e-44),
            ("age of the universe", 4.3e17),
        ],
    },
}
category_names = list(categories.keys())


def make_traces(name):
    d = categories[name]
    lo, hi = d["human_range"]
    range_trace = go.Scatter(
        x=[np.log10(lo), np.log10(hi)], y=[0, 0], mode="lines",
        line=dict(color="seagreen", width=14),
        opacity=0.35, hoverinfo="skip", showlegend=False,
    )
    xs = [np.log10(v) for _, v in d["points"]]
    hover = [f"{label}<br>≈ 10^{np.log10(v):.0f} {name.split(' ')[-1]}"
             for label, v in d["points"]]
    # Short on-chart labels (full caveats/context live in the hover text
    # instead), alternating above/below the axis so neighboring points on a
    # cramped log scale don't stack their text on top of each other.
    short_labels = [label.split(" (")[0] for label, _ in d["points"]]
    positions = ["top center" if i % 2 == 0 else "bottom center"
                 for i in range(len(xs))]
    point_trace = go.Scatter(
        x=xs, y=[0] * len(xs), mode="markers+text",
        marker=dict(size=14, color="firebrick", symbol="diamond"),
        text=short_labels,
        textposition=positions,
        hovertext=hover, hoverinfo="text", showlegend=False,
    )
    return range_trace, point_trace


fig = go.Figure()
all_x = []
for i, name in enumerate(category_names):
    r_trace, p_trace = make_traces(name)
    r_trace.visible = (i == 0)
    p_trace.visible = (i == 0)
    fig.add_trace(r_trace)
    fig.add_trace(p_trace)
    d = categories[name]
    all_x += [np.log10(v) for _, v in d["points"]] + [np.log10(x) for x in d["human_range"]]

buttons = []
for i, name in enumerate(category_names):
    visible = [False] * (2 * len(category_names))
    visible[2 * i], visible[2 * i + 1] = True, True
    buttons.append(dict(label=name, method="update",
                         args=[{"visible": visible},
                               {"xaxis.title.text": f"log10( {name} )"}]))

fig.update_layout(
    title="Human perception (green) vs. the full range physics probes (red)",
    xaxis=dict(title="log10( Mass (kg) )", range=[min(all_x) - 3, max(all_x) + 3]),
    yaxis=dict(visible=False, range=[-1.6, 1.6]),
    autosize=True, height=380,
    updatemenus=[dict(type="buttons", direction="right", x=0.0, y=1.25,
                       xanchor="left", buttons=buttons, active=0)],
    margin=dict(t=90),
)
show_fig(fig)
```

Switch between Mass / Length / Time: in every single case, the thin green band where
unaided human judgment lives is a rounding error against the full red-marked range —
and this is *before* accounting for the fact that the true endpoints (observable
universe, Planck scale) are themselves still moving targets.

## Planck units, and why the asymmetry?

Three constants carry no reference to human-scale units at all: Planck's constant
$h$ (energy $\times$ time), the speed of light $c$ (length/time), and Newton's
gravitational constant $G$. Dimensional analysis lets you build exactly one
combination of the three with dimensions of length, one with dimensions of time, and
one with dimensions of mass — the Planck length, Planck time, and Planck mass.

Numerically, $\ell_P \sim 10^{-35}\,\text{m}$ and $t_P \sim 10^{-42}\,\text{s}$ sit at
the *very bottom* of the length and time ranges above. But the Planck mass,
$m_P \sim 2\times10^{-8}\,\text{kg}$, is enormous compared to an electron or even a
proton — it is not a lower bound on anything physical. The asymmetry has a real
reason: $\ell_P$ and $t_P$ are believed to be the scales at which spacetime *itself*
stops behaving like a smooth continuum — quantum fluctuations of geometry take over,
the way a straight-edged sheet of paper reveals a jagged tear only once you look close
enough. Mass carries no matching statement about the breakdown of continuity, so
there is no reason for $m_P$ to bound anything from below.

## Physical laws are effective, not absolute

Every physical theory comes stamped with a validity range. Sketch two axes —
characteristic velocity (compared to $c$) and characteristic length/action scale
(compared to $\hbar$) — and the theories tile the plane: non-relativistic Newtonian
mechanics for everyday $v \ll c$ and macroscopic scales; non-relativistic quantum
mechanics once you shrink to atomic scales at the same low speeds; special and general
relativity as you push $v \to c$ at macroscopic scales (astrophysics is the natural
home for this); and relativistic quantum field theory in the corner where both apply
at once. That last corner is unavoidable, not optional: once matter and energy can
interconvert, "a fixed number of particles" stops being a meaningful assumption, so no
consistent single-particle relativistic quantum theory can exist — you're forced into
a many-body (field) framework.

This is why "is the electron a wave or a particle?" is the wrong kind of question: an
object is nothing more than shorthand for an agreed-on bundle of properties, and *wave*
and *particle* are words minted for the middle-dimension regime. Outside the regime
where they were defined, expecting them to still apply cleanly is asking language to
do a job it was never built for — not encountering a paradox in nature.

This layering also means reductionism is not always the useful move. Designing a
better carburetor needs none of the underlying organic chemistry, let alone
quantum chromodynamics — each regime carries its own effective, self-contained laws,
and it is the *boundary* between regimes (where does classical stop and quantum begin?
Is the transition sharp or fuzzy?) that tends to be the genuinely interesting physics.

## Emergent properties

Some properties belong only to the collection, never to any one constituent: a single
water molecule has no phase (solid/liquid/gas — that classification requires enough
molecules to even define it); a single atom has no color; a single photon cannot
produce laser light. Put a sufficient number of *identical, weakly interacting*
components together under the right conditions, and qualitatively new, collective
behavior appears that no amount of studying one component in isolation would have
predicted. Understanding when and how these properties emerge — not just what the
microscopic rules are — is one of the recurring threads of this course.
