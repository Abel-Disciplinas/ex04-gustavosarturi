function bissecao(f::Function, a::Real, b::Real, estrategia::Symbol; atol=1e-6, rtol=1e-6, maxiter=10_000)

    function strategy(f::Function, a::Real, b::Real, estrategia::Symbol)
        if estrategia ==:bisseccao
            x = (a + b) / 2
        elseif estrategia ==:esquerda
            x = 0.1 * a + 0.9 * b
        elseif estrategia ==:direita
            x = 0.9 * a + 0.1 * b
        elseif estrategia ==:aleatorio
            r = rand()
            x = a * r + b * (1 - r)
        elseif estrategia ==:false_posicao
            x = (a * f(b) - b * f(a)) / (f(b) - f(a))
        end
        return x
    end

    (fa, fb) = (f(a), f(b))
    ϵ = atol + rtol * (abs(fa) + abs(fb)) / 2
    if abs(fa) <= ϵ
        return a, fa, 0
    elseif abs(fb) <= ϵ
        return b, fb, 0
    elseif fa * fb > 0
        error("f(a) e f(b) devem ter sinais diferentes")
    end

    x = strategy(f, a, b, estrategia)
    fx = f(x)
    iter = 1
    while !(abs(fx) <= ϵ || iter > maxiter)
        if fx * fa < 0
            b = x
        else
            a = x
        end

        x = strategy(f, a, b, estrategia)
        fx = f(x)
        iter += 1
    end

    return x, fx, iter
end
