function stooge_sort!(A, i=1, j=length(A))
    if A[j] < A[i]
        A[[i, j]] = A[[j, i]];
    end
    if (j - i) > 1
        t = round(Int, (j - i + 1) / 3)
        A = stooge_sort!(A, i, j - t)
        A = stooge_sort!(A, i + t, j)
        A = stooge_sort!(A, i, j - t)
    end
    update!(A,i,j,j)
    col[] = A
    return A
end