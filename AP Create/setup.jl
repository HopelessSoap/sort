using Random, Observables
include("sortMerge.jl"); include("sortBubble.jl"); include("sortQuick.jl")
include("vizualize.jl")

arrLength = 128 # length of the array
sleepTime = 0.05 # controls speed of sort

# elements that are being compared together, highlighted in viz
compare1 = Observable(1)
compare2 = Observable(1)

# create the array
createarray() = shuffle(collect(1:arrLength))
A = createarray()
OA = Observable(A)

#println("Unsorted Array: $A")
viz(OA) # vizualize.jl