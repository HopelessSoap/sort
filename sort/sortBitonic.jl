function comp_and_swap!(A, i, j, dir)
    if (dir==1 && A[i] > A[j]) || (dir==0 && A[i] < A[j])
        @inbounds A[i],A[j] = A[j],A[i]
        update!(A,i,j,i)
    end
end

function bitonic_merge!(A, low, cnt, dir)
    if cnt > 1
        k = div(cnt, 2)
        @inbounds for i = low:low+k-1
            comp_and_swap!(A, i, i+k, dir)
        end
        bitonic_merge!(A, low, k, dir)
        bitonic_merge!(A, low+k, k, dir)
    end
end

function bitonic!(A, low, cnt, dir)
    if cnt > 1
        k = div(cnt, 2)
        bitonic!(A, low, k, 1)
        bitonic!(A, low+k, k, 0)
        bitonic_merge!(A, low, cnt, dir)
    end
end

function bitonic_sort!(A, n = length(A), up = 1)
    bitonic!(A, 1, n, up)
    OA[] = A # finally, update the array to ensure that it shows as sorted
    col[] = A
    return A
end
