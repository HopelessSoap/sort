function swap!(A, a, b) # swap array indexes a & b
    A[a], A[b] = A[b], A[a]
end

function stooge_sort!(A, l = 1, r = length(A))
    if A[l] > A[r]
        swap!(A,A[l],A[r])
    end; if r - l > 2
        t = floor((r - l)/3)
        stooge_sort!(A, l, r-t)
        stooge_sort!(A, l+1, r)
        stooge_sort!(A, l, r-t)
    end
end