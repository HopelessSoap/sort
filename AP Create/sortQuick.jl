function quick_sort!(A = A, lo = 1, hi = length(A))
    i, j = lo, hi
    while i < hi
        pivot = A[(lo+hi)>>>1]
        while i ≤ j
            while A[i] < pivot; i = i+1; end
            while A[j] > pivot; j = j-1; end
            if i ≤ j
                A[i], A[j] = A[j], A[i]
                i, j = i+1, j-1
            end
            OA[] = A
            sleep(sleepTime)
        end
        if lo < j; quick_sort!(A,lo,j); end
        lo, j = i, hi
    end
    return A
end