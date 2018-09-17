using Plots
gr(size=(600,400))

include("bisseccao.jl")

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
        x, fx, k = bisseccao(f, a, b, :bisseccao)
        println("x = $x")
        println("f(x) = $fx")
        println("iterações = $k")
        plot(f, a, b) #Não sei por qual razão, não está plotando...
        println()
    end
end

tests()
