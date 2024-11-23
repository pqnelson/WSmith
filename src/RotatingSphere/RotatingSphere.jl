"""
For a rotating 2-dimensional sphere, there are two families of
solutions which are well known: Rossby-Haurwitz solutions (using
spherical harmonics), and zonal solutions.

We are currently interested in trying to model Earth's atmosphere as a
2-dimensional compressible Euler fluid. Rossby and friends have
studied it as an _incompressible_ fluid, which simplifies the
mathematics but is an invalid approximation in three-dimensions. Does
it matter in two-dimensions?

## Approximation to thin shell 3-dimensional compressible Navier-Stokes

Adrian Constantin and Robin Johnson have investigated in a couple of
papers (2021) the leading order terms of compressible Navier-Stokes
fluids on rotating ellipsoid, and we see they are solutions to the
incompressible 2-dimensional Euler fluid on a rotating ellipsoid.

Constantin and Johnson supplement the compressible Navier-Stokes
equations with the ideal gas Law (which is a good approximation for
the atmosphere):
```math
p = ρ R T
```
(where ``R≈287 m^{2}s^{-2}K^{-1}`` is the gas constant for Earth's
atmosphere) and the first Law of Thermodynamics: 
```math
c_{p}\\frac{\\mathrm{D}T}{\\mathrm{D}t} - κ\\nabla^{2}T - \\frac{1}{ρ}\\frac{\\mathrm{D}ρ}{\\mathrm{D}t} = Q
```
where ``c_{p}≈10^{3}m^{2}s^{-2}K^{-1}`` is the constant specific heat
of predominantly dry air at constant pressure, and
``κ/c_{p}≈2×10^{-5}m^{2}s^{-1}`` is the constant thermal
diffusivity. Here ``Q`` is a general heat source term. We could make
``Q`` the [Solar constant](https://en.wikipedia.org/wiki/Solar_constant)
and use [Stefan--Boltzmann law](https://en.wikipedia.org/wiki/Stefan%E2%80%93Boltzmann_law) to determine the effective
temperature applied to one
half of the Earth at the "top" of the atmosphere, for example.

What Constantin and Johnson do is rather interesting: they consider
the Earth as an ellipsoid, with the semi-major axis being
``d_{E}≈6378\\,\\mathrm{km}`` and the semi-minor axis being
``d_{P}≈6356\\,\\mathrm{km}``. The eccentricity for this ellipsoid is
then ``\\mathfrak{e}≈0.0810208203``. They define on page 761 the parameter
``δ := \\mathfrak{e}^{2}≈0.0065743``
and (on page 759, in Equation (2.8)) ``ε = H/d_{E}\\leq 0.00250863`` is the ratio of
the maximum height of the 
troposphere ``H`` to the semi-major axis of the Earth. Needless to
say, both ``δ`` and ``ε`` are positive and much smaller than 1.

By perturbatively expanding the equations of motion in terms of ``ε`` and
``δ``, Constantin and Johnson find the leading contribution resembles the
Euler fluid on a two-dimensional sphere.

## Fast rotating planets

Recently, the question about these solutions for "fast rotating
spheres" has been of interest (since Jupiter is a fast rotating
sphere: its radius is 10.973 times larger than Earth's, its synodic
rotation period ("day") is 9.9258 hours (9 hours, 55 minutes, 33
seconds) --- so the rotational velocity on the equator is something
like 24 times faster than Earth's).

# References

## Classics

- C.-G. Rossby, "Relation between variations in the intensity of the
  zonal circulation of the atmosphere and the displacements of the
  semi-permanent centers of action".
  _J. mar. Res._ **2** (1939) 38-55.
  [Eprint](https://elischolar.library.yale.edu/journal_of_marine_research/486/)
- B. Haurwitz, "The motion of atmospheric disturbances on the
  spherical earth."
  _J. mar. Res_ **3** no.5 (1940) 254-267
  [Eprint](https://elischolar.library.yale.edu/journal_of_marine_research/575/)
- Richard A. Craig, "A solution of the nonlinear vorticity equation for
  atmospheric motion". 
  _Journal of Atmospheric Sciences_ **2** no.3 (1945), 175-178
  doi:[10.1175/1520-0469(1945)002<0175:ASOTNV>2.0.CO;2](https://doi.org/10.1175/1520-0469(1945)002<0175:ASOTNV>2.0.CO;2)

## Leading-order solution to Navier-Stokes

- Adrian Constantin and Robin S. Johnson,
  "On the modelling of large-scale atmospheric flow".
  _J. of Differential Equations_ **285** (2021) 751-798
  doi:[10.1016/j.jde.2021.03.019](https://doi.org/10.1016/j.jde.2021.03.019)
  - Discusses the mathematical details of their approximation scheme
- Adrian Constantin and Robin S. Johnson,
  "On the propagation of waves in the atmosphere".
  _Proc. of the Royal Soc. A_ **477** no.2250 (2021)
  doi:[10.1098/rspa.2020.0424](https://doi.org/10.1098/rspa.2020.0424)
  - Discusses the physical interpretation of the previous paper

## Contemporary

- Michael Taylor, Jeremy L. Marzuola,
  "Euler Equation on a Rotating Surface".
  [arXiv:1508.04196](https://arxiv.org/abs/1508.04196), 63 pages
- Adrian Constantin, Pierre Germain,
  "Stratospheric planetary flows from the perspective of the Euler equation on a rotating sphere".
  [arXiv:2109.08797](https://arxiv.org/abs/2109.08797), 37 pages
- Chenghao Xu,
  "The Non-zonal Rossby-Haurwitz Solutions of the 2D Euler Equations on a Rotating Ellipsoid".
  [arXiv:2310.17854](https://arxiv.org/abs/2310.17854), 22 pages
"""
module RotatingSphere end
