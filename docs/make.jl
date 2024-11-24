using Documenter, WSmith
#, WSmith.RotatingSphere

makedocs(
    format = Documenter.HTML(),
    sitename="WSmith.jl",
    pages = [
        "index.md",
        "rotating_sphere.md",
        "thermodynamics.md",
    ],
)
