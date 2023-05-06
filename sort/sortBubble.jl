function swap!(A, a, b) # swap array indexes a & b
    A[a], A[b] = A[b], A[a]
end

function bubble_sort!(A, n = length(A))
    for i ∈ 1:n-1
        for j ∈ 2:n
            if A[j-1] > A[j]
                swap!(A,j-1,j)
                # changing the modulo value changes how fast it sorts, but can reduce the accuracy of the visualization
                j%5 == 0 ? OA[] = A : continue
                sleep(sleepTime)
            end
        end
    end
    OA[] = A # finally, update the array to ensure that it shows as sorted
    return A
end;
