using Random, Observables, GLMakie
include("sortMerge.jl"); include("sortBubble.jl"); include("sortQuick.jl"); include("sortHeap.jl"); include("sortStooge.jl")

GLMakie.activate!(
    title = "Sort", 
    fxaa = false, 
    vsync = false, 
    render_on_demand = false, 
    framerate = 240,
    focus_on_show = false
)

arrLength = 512; println("Array length = $arrLength") # length of the array
sleepTime = 0.001; println("Sleep time = $sleepTime seconds ") # controls speed of sort
colors = :viridis
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

# change sleep time
function time(a)
    global sleepTime = a
    println("Sleep time is now $a seconds")
end

# create and/or update the array
function create(arrLength = arrLength)
    arr = shuffle(collect(1:arrLength))
    global A = arr
    global OA = Observable(A)
    viz()
end