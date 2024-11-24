# Addition for differential operators

Consider the following code:

```julia
julia> using Symbolics

julia> @variables t x u(..)
3-element Vector{Any}:
 t
 x
  u⋆

julia> d_dt = Differential(t)
Differential(t)

julia> d_dx = Differential(x)
Differential(x)

julia> (d_dt + (u*d_dx))
ERROR: MethodError: no method matching +(::Differential, ::ComposedFunction{Num, Differential})
The function `+` exists, but no method is defined for this combination of argument types.

Closest candidates are:
  +(::Any, ::Any, ::Any, ::Any...)
   @ Base operators.jl:596
  +(::MutableArithmetics.Zero, ::Any)
   @ MutableArithmetics ~/.julia/packages/MutableArithmetics/BLlgj/src/rewrite.jl:64
  +(::Any, ::MutableArithmet
```

This should work. This is probably related to [issue 973](https://github.com/JuliaSymbolics/Symbolics.jl/issues/973).
