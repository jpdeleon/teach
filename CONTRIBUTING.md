# Contributing

## Repository Structure

This repository publishes a root Jupyter Book (`intro.md`, built from `_toc.yml`) that links
out to several self-contained sub-books, each with its own `_toc.yml` and independent build:

- `physics/theoretical/`, `physics/applied/`, `physics/general/`
- `astronomy/`
- `observation_data_analysis/`
- `space_earth_science/`
- `statistics_algorithms/`
- `philosophy_teaching/`

Each sub-book's landing page (`<sub-book>/index.md`) is linked to directly from the root
book's sidebar — there is no separate root-level summary page per sub-book, including for
the three physics sub-books.

## Building the Books

### Root book

```bash
uv run jupyter-book build .
```

### Astronomy

```bash
cd astronomy
jupyter-book build .
```

### Astronomical Observation and Data Analysis

```bash
cd observation_data_analysis
jupyter-book build .
```

### Space & Earth Science

```bash
cd space_earth_science
jupyter-book build .
```

### Statistics & Algorithms

```bash
cd statistics_algorithms
jupyter-book build .
```

### Philosophy of Teaching Science

```bash
cd philosophy_teaching
jupyter-book build .
```

### Physics sub-books

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

Or build all physics sub-books from root:

```bash
for book in physics/theoretical physics/applied physics/general; do
    jupyter-book build $book
done
```

## Deployment

`.github/workflows/deploy-pages.yml` builds the root book and every sub-book, assembles
them into `_site/`, and deploys to GitHub Pages on every push to `main`.
