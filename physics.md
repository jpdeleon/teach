# Physics Courses

Physics is organized into three independent Jupyter Books, each focusing on a different aspect:

```{tableofcontents}
```

## Sub-books

### 📐 Theoretical Physics
**Path:** `physics/theoretical/`

Based on Prof. V. Balakrishnan's lecture series:
- Classical Physics
- Quantum Physics
- Mathematical Physics
- Stochastic Processes
- Nonlinear Dynamics
- Nonequilibrium Statistical Mechanics

<a href="physics/theoretical/index.html">Build & View →</a>

### 🔬 Applied Physics
**Path:** `physics/applied/`

Hands-on physics from popular YouTube channels:
- Action Lab
- Applied Science
- Engineer Guy
- Real Engineering
- NightHawkInLight
- Smarter Everyday
- Branch Education

<a href="physics/applied/index.html">Build & View →</a>

### 📚 General Physics
**Path:** `physics/general/`

General resources, animations, simulations, and textbooks:
- Animations & Visualizations
- Interactive Simulations
- References & Resources
- Textbooks

<a href="physics/general/index.html">Build & View →</a>

## Building Individual Books

Each sub-book can be built independently:

```bash
# Theoretical Physics
cd physics/theoretical
jupyter-book build .

# Applied Physics
cd physics/applied
jupyter-book build .

# General Physics
cd physics/general
jupyter-book build .
```

Or build all from root:
```bash
# Build all physics books
for book in physics/theoretical physics/applied physics/general; do
    jupyter-book build $book
done
```