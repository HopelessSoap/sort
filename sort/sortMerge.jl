@inline function merge_sort!(A, lo = 1, hi = length(A))
    if lo < hi
        q = div(lo+hi, 2)
        merge_sort!(A, lo, q)
        merge_sort!(A, q+1, hi)
        merge!(A, lo, q, hi)
    end
    OA[] = A # finally, update the array to ensure that it shows as sorted
    col[] = A # update color also
    A
end

function merge!(A, lo, q, hi)
    sentinel = typemax(eltype(A))
    L = A[lo:q]
    R = A[(q+1):hi]
    push!(L, sentinel)
    push!(R, sentinel)
    i, j = 1, 1
    @inbounds for k ∈ lo:hi
        if L[i] ≤ R[j]
            A[k] = L[i]
            update!(A,k,q,k)
            i += 1
        else
            A[k] = R[j]
            update!(A,k,q,k)
            j += 1
        end
    end
end
