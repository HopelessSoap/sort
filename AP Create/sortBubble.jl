# code from me

function swap!(A, a, b) # swap array indexes a & b
    # vizualiation stuff
    compare1[] = a
    compare2[] = b

    temp = A[a] #
    A[a] = A[b] # this is what matters
    A[b] = temp #
    
    # moar vizualiation stuff
    OA[] = A
    sleep(sleepTime)
end

function bubble_sort!(A, len = length(A))
    for i ∈ 1:len-1
        for j ∈ 2:len
            if A[j-1] > A[j]
                swap!(A,j-1,j)
            end
        end
    end; A
end
