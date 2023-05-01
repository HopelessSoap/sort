using Random, Observables, GLMakie
include("sortMerge.jl"); include("sortBubble.jl"); include("sortQuick.jl"); include("sortHeap.jl")

arrLength = 256; println("Array length = 256") # length of the array
sleepTime = 0.004; println("Sleep time = 0.004 seconds ") # controls speed of sort

start() = include("setup.jl")

# change length of array
function array_len(a)
    global arrLength = a
    create()
    println("Array length is now $a")
end

# change sleep time
function time(a)
    global sleepTime = a
    println("Sleep time is now $a seconds")
end

# create the array
A = []
OA = Observable(A)
function create(arrLength = arrLength)
    arr = shuffle(collect(1:arrLength))
    global A = arr
    global OA = Observable(A)
end; create(arrLength)

# vizualiazation
function viz(OA = OA)
    f = Figure()
        ax = Axis(f[1, 1]); hidedecorations!(ax); hidespines!(ax); tightlimits!(ax)
        x = 1:arrLength
        y = OA
        barplot!(x, y, color = :black)
    f
end