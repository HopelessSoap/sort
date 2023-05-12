# code adapted from https://github.com/Gaming32/ArrayV/blob/main/src/main/java/io/github/arrayv/sorts/concurrent/PairwiseSortRecursive.java

function pairwise_sort!(A, start=1, finish=length(A)+1, gap=1)
    if start == finish - gap
        return
    end
    b = start + gap
    while b < finish
        if A[b - gap] > A[b]
            A[b - gap], A[b] = A[b], A[b - gap]
        end
        b += 2 * gap
    end
    if (finish - start) ÷ gap % 2 == 0
        pairwise_sort!(A, start, finish, 2 * gap)
        pairwise_sort!(A, start + gap, finish + gap, 2 * gap)
    else
        pairwise_sort!(A, start, finish + gap, 2 * gap)
        pairwise_sort!(A, start + gap, finish, 2 * gap)
    end
    a = 1
    while a < (finish - start) ÷ gap
        a = a * 2 + 1
    end
    b = start + gap
    count = 1 # count for update! function
    while b + gap < finish
        c = a
        while c > 1
            c = c ÷ 2
            if b + c * gap < finish
                update!(A,b,b+c*gap,count); count += 1
                if A[b] > A[b + c * gap]
                    A[b], A[b + c * gap] = A[b + c * gap], A[b]
                end
            end
        end
        b += 2 * gap
    end
    OA[] = A
    col[] = A
    return A
end