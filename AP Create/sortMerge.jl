# written with the help of an external source

function merge_sort!(A = A, p = 1, r = length(A))
    if r > p
        q = div(p+r, 2)
        merge_sort!(A, p, q) # sorts first half
        merge_sort!(A, q+1, r) # sorts second half
        merge!(A, p, q, r)
    end; A
end

function merge!(A, p, q, r)
    s = typemax(eltype(A))
    L = A[p:q]
    R = A[(q+1):r]
    push!(L, s)
    push!(R, s)
    i, j = 1, 1
    for k ∈ p:r
        if L[i] ≤ R[j]
          A[k] = L[i]
          i += 1
        else
          A[k] = R[j]
          j += 1
        end
      
      OA[] = A
      sleep(sleepTime)
    end
end