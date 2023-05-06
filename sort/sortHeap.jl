function swap!(A, a, b) # swap array indexes a & b
    A[a], A[b] = A[b], A[a]
end

function heapify!(A, n)
    f = n÷2
    while f≥1
        siftdown!(A, f, n)
        f -= 1

        # changing the modulo value changes how fast it sorts, but can reduce the accuracy of the visualization
        f%4 == 0 ? OA[] = A : continue
        sleep(sleepTime)
    end
end

function siftdown!(A, first, last)
    while (c = 2*first - 1) < last
        if c < last && A[c] < A[c+1]
            c += 1
        end; if A[first] < A[c]
            swap!(A, c, first)
            first = c
        else; break; end
    end
end

function heap_sort!(A, n = length(A))
    heapify!(A, n)
    l = n
    while l > 1
        swap!(A, 1, l)
        l -= 1
        siftdown!(A, 1, l)

        # changing the modulo value changes how fast it sorts, but can reduce the accuracy of the visualization
        l%4 == 0 ? OA[] = A : continue
        sleep(sleepTime)
    end; A
end