function merge_sort_in_place!(A, lo = 1, hi = length(A))
    if lo < hi
        q = div(lo+hi, 2)
        merge_sort_in_place!(A, lo, q)
        merge_sort_in_place!(A, q+1, hi)
        merge_in_place!(A, lo, q, hi)
    end
    OA[] = A
    col[] = A
    return A
end

function merge_in_place!(A, lo, q, hi)
    i, j = lo, q+1
    while i < j ≤ hi
        if A[i] > A[j]
            temp = A[j]
            for k = j-1:-1:i
                A[k+1] = A[k]
                update!(A,k,i,k)
            end
            A[i] = temp
            j += 1
        end
        i += 1
    end
end