- Disassembly macros
  - `@code_lowered` produces the IR for some expression
  - `@code_llvm` produces the LLVM instructions for some expression
  - `@code_native` produces native assembly code for some expression

# Building the documents

After making some changes to WSmith.jl (e.g., adding dependencies),
the way to have Documenter.jl be able to handle them requires
performing the following on the command line:

```
~/src/WSmith/$ cd docs
~/src/WSmith/docs/$ julia --package
julia> ]

(docs) pkg> dev ..
...
(docs) pkg> resolve
...
(docs) pkg> instantiate
...
julia> exit()
~/src/WSmith/docs/$ julia --project make.jl
```

Building the docs requires running that last line.
