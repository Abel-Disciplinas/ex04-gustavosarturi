function tests()
    funcoes = [ (x -> 2x - 3, 0, 5), #Abel
                (x -> x^2 - 2, 1, 2), #Abel
                (x -> x * exp(x) - 1, 0, 1), #Abel
                (x -> log(x + π), -3, -1), #Gustavo
                (x -> (x^2 - 1) * sin(4x^2), 0.5, 0.9), #Gustavo
                (x -> (cos(x))^3 * e^x + 7, 2, 3), #Gustavo
                (x -> 27 * x^2 - 0.5, -1/3, 0), #Leticião
                (x -> sin(3x) - 2x, 1e-2, 0.5), #Leticião
                (x -> 3 * e^x - 5, 0, 1), #Leticião
                (x -> x^17 + x^9 + x^2018, -1, 1), #Jaque
                (x -> e^(sin(x))-1, 0, 5), #Jaque
                (x -> 5 * e^(sin(x)) - 10, 0, 2), #Jaque
                (x -> x^4 - 16, 0, 4), #Abel
                (x -> sin(1/x), 1e-8, 1e-2), #Abel
                (x -> 2000 * x - 1, 1e-5, 1e-2), #Dida
                (x -> cos(x^10), -1.25, -1)] #Dida
    for i = 1:length(funcoes)
        (f, a, b) = funcoes[i]
        println("Exemplo $i")
        
        #existe possibilidade de se criar um for com char/sting?
        
        println("Bissecção : ")
        x, fx, k = bisseccao(f, a, b, :bisseccao)
        println("x = $x")
        println("f(x) = $fx")
        println("iterações = $k")
        miniter = k
        methoditer = :bisseccao
        methodapprox = :bisseccao
        apfunction = fx
        println()
        
        println("Direita : ")
        x, fx, k = bisseccao(f, a, b, :direita)
        println("x = $x")
        println("f(x) = $fx")
        println("iterações = $k")
        if k < miniter
            miniter = k
            methoditer = :direita
        end
        if fx < apfunction
            apfunction = fx
            methodapprox = :direita
        end
        println()
        
        println("Esquerda :  : ")
        x, fx, k = bisseccao(f, a, b, :esquerda)
        println("x = $x")
        println("f(x) = $fx")
        println("iterações = $k")
        if k < miniter
            miniter = k
            methoditer = :esquerda
        end
        if fx < apfunction
            apfunction = fx
            methodapprox = :esquerda
        end
        println()
        
        println("Aleatório : ")
        x, fx, k = bisseccao(f, a, b, :aleatorio)
        println("x = $x")
        println("f(x) = $fx")
        println("iterações = $k")
        if k < miniter
            miniter = k
            methoditer = :aleatorio
            methodapprox = :aleatorio
        end
        if fx < apfunction
            apfunction = fx
        end
        println()
        
        println("Falsa Posição : ")
        x, fx, k = bisseccao(f, a, b, :falsa_posicao)
        println("x = $x")
        println("f(x) = $fx")
        println("iterações = $k")
        if k < miniter
            miniter = k
            methoditer = :falsa_posicao
        end
        if fx < apfunction
            apfunction = fx
            methodapprox = :falsa_posicao
        end
        println()
                        
        println("Melhor em relação a iterações : ", methoditer)
        println("Iterações : ", miniter)
        
        println("Melhor em relação a aproximação : ", methodapprox)
        println("Value : ", apfunction)
        
        #Observações: Não consegui utilizar o Plot(f, a, b)
    end
end

tests()
