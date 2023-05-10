using Random, Observables, GLMakie
include("sortBubble.jl"); include("sortQuick.jl"); include("sortHeap.jl"); include("sortGnome.jl"); include("sortShell.jl"); include("sortMerge.jl")
include("sortStooge.jl"); include("sortBitonic.jl"); include("sortGPT.jl")
GLMakie.activate!(
    title = "Sort", 
    fxaa = false, 
    vsync = false, 
    render_on_demand = true, 
    framerate = 120,
    focus_on_show = false
)

arrLength = 16; println("Array length = $arrLength") # length of the array
arrType = "shuffle"; println("Array type = $shuffle") # type of array
sleepTime = 0; println("Sleep time = $sleepTime seconds ") # controls speed of sort
frequency = 0 # how often to update the plot; changes depending on the length of the plot
A = []
col = Observable(A)
OA = Observable(A)

# create visualization window
# makie is slow as hell and i probably shouldn't be using it
function viz(OA = OA, col = col, len = arrLength, A = A)
    f = Figure(backgroundcolor = :black)
    ax = Axis(f[1, 1], backgroundcolor = :black); hidedecorations!(ax); hidespines!(ax); tightlimits!(ax)
    x = 1:len
    barplot!(x, OA, gap = 0, color = col, colormap = :viridis, colorrange = (1,length(A)), lowclip = :red); f
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
# i don't think it's best practice to be using global like this. too bad
function create(arrLength = arrLength)
    # define array type
    if arrType == "shuffle"; arr = shuffle(collect(1:arrLength))
    elseif arrType == "reverse"; arr = reverse(collect(1:arrLength))
    elseif arrType == "random"; arr = rand(1:arrLength, arrLength); end

    # define update frequency based on length of plot
    if arrLength < 256; global frequency = 1
    elseif arrLength ≤ 512; global frequency = 2
    elseif arrLength ≤ 1024; global frequency = 3
    else; global frequency = 4; end
    global A = arr
    global OA = Observable(A)
    global col = Observable(A)
    viz()
end