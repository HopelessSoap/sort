using Random, Observables, GLMakie
include("sortBubble.jl"); include("sortQuick.jl"); include("sortHeap.jl"); include("sortGnome.jl"); include("sortShell.jl"); include("sortMerge.jl")
include("sortStooge.jl"); include("sortBitonic.jl"); include("sortGPT.jl"); include("sortMergeInPlace.jl"); include("sortPairwise.jl")
GLMakie.activate!(
    title = "Sort", 
    fxaa = false, 
    vsync = false, 
    render_on_demand = true, 
    framerate = 120,
    focus_on_show = false
)

arrLength = 512; println("Array length = $arrLength") # length of the array
arrType = "shuffle"; println("Array type = $shuffle") # type of array
sleepTime = 0.01; println("Sleep time = $sleepTime seconds ") # controls speed of sort
frequency = 0 # how often to update the plot; changes depending on the length of the plot
A = []
col = Observable(A)
OA = Observable(A)

# create visualization window
function viz(OA = OA, col = col, len = arrLength, A = A)
    f = Figure(backgroundcolor = :black)
    ax = Axis(f[1, 1], backgroundcolor = :black); hidedecorations!(ax); hidespines!(ax); tightlimits!(ax)
    x = 1:len
    barplot!(x, OA, gap = 0, color = col, colormap = :deep, colorrange = (1,length(A)), lowclip = :red); f
end

# update visualization
function update!(A, i, j, count)
    if count%frequency == 0
        OA[] = A
        temp = copy(A); temp[[i,j]] .= 0; col[] = (temp)
        sleep(sleepTime)
    end
end

# create and/or update the array
function create()
    arrFunctions = Dict(
        "shuffle" => () -> shuffle(collect(1:arrLength)),
        "reverse" => () -> reverse(collect(1:arrLength)),
        "random" => () -> rand(1:arrLength, arrLength)
    )
    global A = arrFunctions[arrType]()
    global frequency = arrLength < 256 ? 1 : arrLength ≤ 512 ? 3 : arrLength ≤ 1024 ? 4 : 5
    global OA = Observable(A)
    global col = Observable(A)
    viz()
end
