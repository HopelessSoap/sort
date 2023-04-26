using Observables, GLMakie

# TODO: change color of elements being accessed
# TODO: show number of swaps and comparisons
function viz(OA)
    f = Figure(color = :black)
        ax = Axis(f[1, 1]); hidedecorations!(ax); hidespines!(ax); tightlimits!(ax)
        x = 1:arrLength
        y = OA
        barplot!(x, y, color = :black)
    f
end
