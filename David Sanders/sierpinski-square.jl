#= Avila Armenta Fernando Ivan

Este código genera un cuadrado de sierpinski, con base en
el código de Sierpinski de Jeff Bezanson, 
Daniel Jones

=#

using Compose



function sierpinskiSquare(n)
    if n == 0
        compose(context(), polygon([(1,1), (0,1), (0, 0), (1,0)]))
    else
        t = sierpinskiSquare(n - 1)
        compose(context(),
                (context(0,   0, 1/3, 1/3), t),
                (context(0,   2/6, 1/3, 1/3), t),
                (context(0,   4/6, 1/3, 1/3), t),
		 (context(1/3,   0, 1/3, 1/3), t),
                (context(1/3,   4/6, 1/3, 1/3), t),
                (context(2/3,   0, 1/3, 1/3), t),
		(context(2/3,   2/6, 1/3, 1/3), t),
                (context(2/3,   4/6, 1/3, 1/3), t))
    end
end


img = SVG("sierpinski-square.svg", 4inch, 4(sqrt(3)/2)inch)
draw(img, compose(sierpinskiSquare(5),linewidth(0.1mm)))




