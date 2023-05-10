function pairwise_bitonic_sort!(a::Array{T,1}) where T<:Real
    n = length(a)
    p = Int(log2(n))

    # First stage: pairwise comparisons
    for k = 1:p
        r = 2^k
        for j = r:-1:2
            i = j-1
            while i <= n
                if (i ÷ r) ⊻ (j ÷ r) == 1 && a[i] > a[j]
                    a[i], a[j] = a[j], a[i]
                end
                i += r
            end
        end
    end

    # Second stage: bitonic merge
    for k = p-1:-1:0
        r = 2^k
        for j = r:2r:n
            i = j-r
            while i >= 1
                if a[i] > a[i+r]
                    a[i], a[i+r] = a[i+r], a[i]
                end
                i -= r
            end
        end
    end
    return a
end