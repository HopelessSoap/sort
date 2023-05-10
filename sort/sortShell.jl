function shell_sort!(A)
    incr = div(length(A), 2)
    while incr > 0
        for i ∈ incr+1:length(A)
            j = i
            tmp = A[i]
            while j > incr && A[j - incr] > tmp
                A[j] = A[j-incr]
                j -= incr
            end
            A[j] = tmp

            update!(A,i,j,i)
        end
        if incr == 2
            incr = 1
        else
            incr = floor(Int, incr * 5.0 / 11)
        end
    end
    OA[] = A # finally, update the array to ensure that it shows as sorted
    col[] = A
    return A
end