#= Avila Armenta Fernando Ivan

Este código genera un fractal de Vissek, 
específicamente la cruz diagonal.

Este código fué elaborado con base en
el código de Sierpinski de Jeff Bezanson, 
Daniel Jones

=#

for f in ARGS;

using Compose

function vissekCD(n)
    if n == 0
        compose(context(), polygon([(1,1), (0,1), (0, 0), (1,0)]))
    else
        t = vissekCD(n - 1)
        compose(context(),
                (context(0,0, 1/3, 1/3), t),
                (context(0,2/3, 1/3, 1/3), t),
                (context(1/3, 1/3, 1/3, 1/3), t),
		 (context(2/3,0, 1/3, 1/3), t),
                (context(2/3, 2/3, 1/3, 1/3), t) )
    end
end


img = SVG("vissek-diagonal-cross.svg", 4inch, 4(sqrt(3)/2)inch)
draw(img, compose(vissekCD(parse(Int32,f)),linewidth(0.1mm)))

end



