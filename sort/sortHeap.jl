function heapify!(A, n)
    f = n÷2
    while f≥1
        update!(A,f,n,f)
        siftdown!(A, f, n)
        f -= 1
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
        update!(A,1,l,l)
    end
    OA[] = A
    col[] = A
    return A
end