using Symbolics

module Thermodynamics

"""
    ideal_gas_law(; p, R, T, [ρ | α])

Constructor for the Ideal Gas Law as an Equation object. All arguments
are keyword arguments.

Either density `ρ` or specific volume `α` must be given. If neither
are supplied, an error is thrown.

# Arguments
- `p::Any`: the pressure
- `R::Any`: the gas constant for the substance
- `T::Any`: the temperature
- `ρ::Any`: the mass density of the substance
- `α::Any`: the specific volume of the substance
"""
function ideal_gas_law(; p, R, T, ρ=nothing, α=nothing)
    if nothing == ρ
        if nothing == α
            throw(ArgumentError("Missing density ρ and specific volume α"))
        end
        return p * α ~ R * T
    else
        return p ~ ρ * R * T
    end
end
        

"""
From the Ideal Gas Law using the specific volume ``α``:
```math
pα = RT
```
or using density ``ρ``,
```math
p = ρ R T
```
needs the gas constant ``R`` depending on the substance. For dry air,
``R≈287\\,\\mathrm{J}\\,\\mathrm{kg}^{-1}\\,\\mathrm{K}^{-1}``.

Taking the total derivative of the Ideal Gas Law gives us
```math
p\\frac{\\mathrm{D}α}{\\mathrm{D}t} + α\\frac{\\mathrm{D}p}{\\mathrm{D}t}=R\\frac{\\mathrm{D}T}{\\mathrm{D}t}.
```
The thermal energy equation for dry atmosphere is
```math
c_{V}\\frac{\\mathrm{D}T}{\\mathrm{D}t} + p\\frac{\\mathrm{D}α}{\\mathrm{D}t} = Q
```
Using ``c_{p} = c_{V} + R``, the first Law of Thermodynamics for dry
atmosphere can be written as
```math
c_{p}\\frac{\\mathrm{D}T}{\\mathrm{D}t} - α\\frac{\\mathrm{D}p}{\\mathrm{D}t} = Q
```
If we divide through by temperature ``T`` then use the Ideal Gas Law,
we obtain the entropy form of the first Law of Thermodynamics
```math
c_{p}\\frac{\\mathrm{D}\\ln(T)}{\\mathrm{D}t} - R\\frac{\\mathrm{D}\\ln(p)}{\\mathrm{D}t} = \\frac{Q}{T} \\equiv \\frac{\\mathrm{D}s}{\\mathrm{D}t}
```
This is all discussed in Section 2.7 of Holton's _Dynamical Meteorology_
(Academic Press, 2012).

# Arguments
- `c_p::Any`: the specific heat at constant pressure
- `T::Any`: the temperature
- `R::Any`: the gas constant for the atmosphere
- `p::Any`: the pressure of the atmosphere
- `α::Any`: the specific volume for the atmosphere
- `Q::Any`: external source of heat for the atmosphere
- `d_dt::Any`: the time derivative operator
"""
function first_law_for_atmosphere(; c_p, T, R, p, α, Q, d_dt)
    c_p * (d_dt(T)) - α * (d_dt(p)) ~ Q
end

end
