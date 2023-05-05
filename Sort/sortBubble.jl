function swap!(A, a, b) # swap array indexes a & b
    A[a], A[b] = A[b], A[a]
end

function bubble_sort!(A, n = length(A))
    for i ∈ 1:n-1
        for j ∈ 2:n
            if A[j-1] > A[j]
                swap!(A,j-1,j)
            end
        end
    end; A
end;
