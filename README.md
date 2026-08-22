# Course Materials

Jupyter Book v1 course materials for physics, astronomy, data analysis, and statistics.

## Courses

- **Physics** - Theoretical, Applied, and General Physics references
- **Introduction to Astronomy** - Comprehensive astronomy course outline
- **Astronomical Observation and Data Analysis** - Data reduction, photometry, transit modeling
- **Space & Earth Science** - Remote sensing basics
- **Statistics & Algorithms** - Bayesian statistics, MCMC, machine learning
- **Philosophy of Teaching Science** - Teaching philosophy references

## Building with uv

```bash
# Install dependencies
uv sync

# Build the book
uv run jupyter-book build .

# Serve locally
uv run jupyter-book serve .
```

## Building with pip (legacy)

```bash
pip install -r requirements.txt
jupyter-book build .
```

## Output

Built HTML files are in `_build/html/`. Open `_build/html/index.html` in a browser.