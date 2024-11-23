# Home

This is some placeholder text for the `index.md` file, because none of
the Documenter.jl's documents ever said this was needed.

## Building the documentation

Note to self: in `WSmith/` directory, I should run the following
commands:

```
~/src/WSmith$ julia --project=docs/
...
julia> ]
(docs) pkg> instantiate
...
(docs) pkg> dev .
julia> include("docs/make.jl")
```

...because Julia can't make anything as easy as "julia make-docs".

## Viewing these docs locally

Since Julia's Documenter.jl can't work properly on its own, it
requires serving the documents to make "pretty linking" work.

This requires running the following in a shell:

```
~/$ cd src/WSmith/docs/build
~/src/WSmith/docs/build/$ python3 -m http.server --bind localhost
...
```

Only then will links work as expected, because only a demented
bedlemite would think this is a good way to implement a documentation
generator. 

To build the documents, it's still a convoluted mess:

```
~/src/WSmith/$ julia --project=docs/
julia> include("docs/make.jl")
```

If you just tried running `julia docs/make.jl`, it will freak out with
incomprehensible error messages **unless** you run 
`import Pkg; Pkg.add("Documenter")` (or something similar). This whole
thing is a horrible mess.

## Module documentation

```@autodocs
Modules = [WSmith]
```


