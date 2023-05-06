using Random, Observables, GLMakie
include("sortBubble.jl"); include("sortQuick.jl"); include("sortHeap.jl")

GLMakie.activate!(
    title = "Sort", 
    fxaa = false, 
    vsync = false, 
    render_on_demand = true, 
    framerate = 120,
    focus_on_show = false
)

arrLength = 2048; println("Array length = $arrLength") # length of the array
arrType = "shuffle"; println("Array type = $shuffle") # type of array
println("Array types: \"shuffle\", \"reverse\"")
sleepTime = 0.002; println("Sleep time = $sleepTime seconds ") # controls speed of sort
colors = :plasma
A = []
OA = Observable(A)

# create visualization window
function viz(OA = OA)
    f = Figure(backgroundcolor = :black)
    ax = Axis(f[1, 1], backgroundcolor = :black); hidedecorations!(ax); hidespines!(ax); tightlimits!(ax)
    x = 1:arrLength
    barplot!(x, OA, gap = 0, color = OA, colormap = colors); f
end

# change length of array
function array_length(a)
    global arrLength = a
    create()
    println("Array length is now $a")
end

# change type of array
function array_type(a)
    global arrType = a
    create()
    println("Array type is now $a")
end

# change sleep time
function time(a)
    global sleepTime = a
    println("Sleep time is now $a seconds")
end

# create and/or update the array
function create(arrLength = arrLength)
    if arrType == "shuffle"; arr = shuffle(collect(1:arrLength))
    elseif arrType == "reverse"; arr = reverse(collect(1:arrLength)); end
    global A = arr
    global OA = Observable(A)
    viz()
end