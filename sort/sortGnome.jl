function gnome_sort!(A)
    i, j = 1, 2
    while i < length(A)
        if A[i] ≤ A[i+1]
            i = j
            j += 1
        else
            A[i], A[i+1] = A[i+1], A[i]
            i -= 1
            if i == 0
                i = j
                j += 1
            end

            # changing the modulo value changes how fast it sorts, but can reduce the accuracy of the visualization
            update!(A,i,i+1,i)
            sleep(sleepTime)
        end
    end
    OA[] = A # finally, update the array to ensure that it shows as sorted
    return A
end