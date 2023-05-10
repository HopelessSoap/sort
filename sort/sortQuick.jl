function quick_sort!(A, lo = 1, hi = length(A))
    i, j = lo, hi
    while i < hi
        pivot = A[(lo+hi)>>>1]
        while i ≤ j
            while A[i] < pivot; i = i+1; end
            while A[j] > pivot; j = j-1; end
            if i ≤ j
                A[i], A[j] = A[j], A[i]
                i, j = i+1, j-1

                update!(A,i,j,i)
            end
        end
        if lo < j; quick_sort!(A,lo,j); end
        lo, j = i, hi
    end
    OA[] = A # finally, update the array to ensure that it shows as sorted
    col[] = A # update color also
    return A
end