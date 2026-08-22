# Astronomical Observation and Data Analysis

## Course Outline

* **Atmospheric Windows: Which wavelengths are best for observing different targets?**
  * Blackbody Radiation
  * Earth's Atmosphere
* **Science Goals: What and Why to observe**
* **Planning: How to observe the target**
  * Ground-based and Space-based Observations
  * Observing Constraints
    * Where is it? Coordinates
    * Is it observable tonight? Rising and Setting Times
    * North and South Hemispheres
    * Weather: Cloud, Humidity, Turbulence
    * Moon
    * Satellite Trails
  * Signal-to-Noise
    * Exposure Time
    * Filters
* **Engineering: Science vs Cost**
  * Telescope Design and Operation
    * Tracking and Auto-guiding
  * Instrumentation
    * From Analog to Digital: Photographic Plates and CCD
    * Pixel Sensitivity
    * Pixel Scale
    * Field-of-View
    * Total Telescope-Instrument Throughput
* **Data Reduction with Astropy**
  * Dark Current: Dark Frame Subtraction
  * Flat Field: Flat Frame Division
  * Background Subtraction
  * Bad/Hot Pixels
  * Image alignment and [registration](https://github.com/keflavich/image_registration)
* **Plate-solving with Astrometry.net**
* **World Coordinate System (WCS)**
* **Photometry** with Photutils
  * Aperture Photometry
    * Optimizing Aperture Size and Shape
  * PSF Photometry
  * Treatment of Outliers
    * Weather: Cloud, Humidity, Turbulence
    * Other Unaccounted Effects (Systematics)
    * Saturation
    * Cosmic Rays
* **Barycentric Time Correction (MJD to BJD Conversion)**
  * Light Travel Time Delay
* **Transit Modeling**
  * Basic Model
    * [Code: Pytransit](https://pytransit.readthedocs.io/en/latest/)
    * [Code: Starry](https://starry.readthedocs.io/en/latest/?badge=latest)
  * Parameterization
    * Transforms
    * Quadratic Limb Darkening: u1, u2 -> q1, q2 (Kipping+2016)
    * Impact Parameter and Rp/Rs (Espinoza+2018)
    * Stellar Density
* **Period Search, Periodogram**
  * [Box Least Squares](https://docs.astropy.org/en/stable/timeseries/bls.html)
  * [Transit Least Squares](https://github.com/hippke/tls)
  * [Lomb Scargle periodogram](https://docs.astropy.org/en/stable/api/astropy.timeseries.LombScargle.html)
  * [Generalized Lomb-Scargle](https://github.com/mzechmeister/GLS)
* **Spectroscopy**
  * [Code: specutils](https://specutils.readthedocs.io/en/stable/)
  * Cross-correlation
* **RV Modeling**
  * Basic Model
  * Parameterization
* **Joint RV+Transit Modeling**
* **Python Basics**
  * [Code: numpy](https://numpy.org/numpy-tutorials/)
  * Using Jupyter Notebook / Lab / Google Colab
* **Version Control with Git and GitHub**
* **Reproducible research**
  * [Code: showyourwork](https://show-your.work/en/latest/)
  * [Authorea: paper of the future](https://www.authorea.com/users/23/articles/8762-the-paper-of-the-future)
  * [Python packaging guide](https://packaging-guide.openastronomy.org/en/latest/)

## References

* [Datalab notebooks](https://datalab.noirlab.edu/docs/manual/Appendices/Notebooks/Notebooks.html)
* [Open datasets](https://github.com/jonathansick/awesome-astronomy?tab=readme-ov-file#datasets)
* [Lab demo: Optics](https://www.youtube.com/playlist?list=PL4E7FAAD67B171EBC)
* [Lecture series: Astronomical Techniques by Chris Mihos](http://burro.case.edu/Academics/Astr306/)
* [Database: NASA exoplanet archive](https://exoplanetarchive.ipac.caltech.edu/)
* [Book: Experimental astrophysics](https://iopscience.iop.org/book/mono/978-0-7503-3119-7.pdf)
* [Review: Reference frames in Astronomy, 1999](https://www.annualreviews.org/doi/full/10.1146/annurev.astro.37.1.97)
* [Astropy's CCD guide](https://www.astropy.org/ccd-reduction-and-photometry-guide/v/dev/notebooks/00-00-Preface.html)
* [Jason Kendall's course](https://youtube.com/playlist?list=PLyu4Fovbph6cKjOO7vj97V7J6_2PA2FY-&si=DHze01nTDk-rMfHU)
* [Growth Astronomy School](https://www.youtube.com/playlist?list=PLuTcC-SLS5wofH1ET2ThCR4gsbHpJ-D_c)
* [Review: Standard photometric systems](https://www.annualreviews.org/doi/full/10.1146/annurev.astro.41.082801.100251)
* [Review: Digital image reconstruction](https://www.annualreviews.org/doi/full/10.1146/annurev.astro.43.112904.104850)
* [Book: Numerical Python in A&A, Springer](https://www.google.co.jp/books/edition/Numerical_Python_in_Astronomy_and_Astrop/D4k4EAAAQBAJ?hl)
* [Lecture series: Introduction to Computer Science & Programming with Python](https://www.youtube.com/playlist?list=PLUl4u3cNGP63WbdFxL8giv4yhgdMGaZNA)
* [Astronomical Software Carpentry](https://datacarpentry.github.io/astronomy-python/instructor/key-points.html)