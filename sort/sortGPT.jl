# I asked chatGPT to create some sorting algorithms. Here they are

#= The Recursive Bitonic Shell Sort algorithm is a sorting algorithm that combines three well-known sorting algorithms: Shell Sort, Bitonic Sort,
and Recursive Sort. The algorithm uses a combination of these three algorithms to sort an array of elements in ascending or descending order. - ChatGPT =#
function bitonic_shell_sort!(A)
    function bitonic_sort!(A, start, stop, direction, pass)
        if stop - start ≤ 4
            return
        end
        mid = div(start + stop, 2)
        if pass ≥ 5
            bitonic_sort!(A, start, mid, !direction, pass - 1)
            bitonic_sort!(A, mid + 1, stop, direction, pass - 1)
            bitonic_merge!(A, start, stop, direction)
        else
            if direction == (A[start] > A[stop])
                A[start], A[stop] = A[stop], A[start]
            end
        end
    end

    function bitonic_merge!(A, start, stop, direction)
        if stop - start ≤ 1
            return
        end
        mid = div(start + stop, 2)
        for i ∈ start:mid - 1
            if (A[i] > A[mid + i - start]) == direction
                A[i], A[mid + i - start] = A[mid + i - start], A[i]
            end
            update!(A,i,mid+i-start,i)
        end
        bitonic_merge!(A, start, mid, direction)
        bitonic_merge!(A, mid + 1, stop, direction)
    end

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
        pass = log2(incr)
        bitonic_sort!(A, 1, length(A), true, pass)
        if incr == 2
            incr = 1
        else
            incr = floor(Int, incr * 5.0 / 11)
        end
    end
    OA[] = A
    col[] = A
    return A
end

#using Random; x = shuffle(collect(1:32)); println(x); println(pairwise_sort!(x))
