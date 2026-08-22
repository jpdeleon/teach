# Course Materials

Jupyter Book v1 course materials for physics, astronomy, data analysis, and statistics.

## Courses

- **Physics** - Three independent sub-books:
  - Theoretical Physics (6 chapters)
  - Applied Physics (7 chapters)
  - General Physics (4 chapters)
- **Introduction to Astronomy** - Comprehensive astronomy course outline
- **Astronomical Observation and Data Analysis** - Data reduction, photometry, transit modeling
- **Space & Earth Science** - Remote sensing basics
- **Statistics & Algorithms** - Bayesian statistics, MCMC, machine learning
- **Philosophy of Teaching Science** - Teaching philosophy references

## Building with uv

```bash
# Install dependencies
uv sync

# Build root book (includes all courses)
uv run jupyter-book build .

# Build individual physics sub-books
uv run jupyter-book build physics/theoretical
uv run jupyter-book build physics/applied
uv run jupyter-book build physics/general

# Or build all at once
./build_all.sh
```

## Development with live reload

```bash
# Install sphinx-autobuild
uv add sphinx-autobuild

# Serve root book with auto-reload on changes
uv run sphinx-autobuild . _build/html --port 9999

# Serve individual physics books
uv run sphinx-autobuild physics/theoretical physics/theoretical/_build/html --port 9991
uv run sphinx-autobuild physics/applied physics/applied/_build/html --port 9992
uv run sphinx-autobuild physics/general physics/general/_build/html --port 9993
```

## Quick serve (no auto-reload)

```bash
# Root book
uv run python -m http.server 8000 --directory _build/html

# Physics sub-books
uv run python -m http.server 8001 --directory physics/theoretical/_build/html
uv run python -m http.server 8002 --directory physics/applied/_build/html
uv run python -m http.server 8003 --directory physics/general/_build/html
```

## Output

- Root book: `_build/html/index.html`
- Theoretical Physics: `physics/theoretical/_build/html/index.html`
- Applied Physics: `physics/applied/_build/html/index.html`
- General Physics: `physics/general/_build/html/index.html`

Open any `index.html` in a browser, or use the server commands above.