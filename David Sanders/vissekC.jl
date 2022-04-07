#= Avila Armenta Fernando Ivan

Este código genera un fractal de Vissek, 
específicamente la cruz.

Este código fué elaborado con base en
el código de Sierpinski de Jeff Bezanson, 
Daniel Jones

=#

using Compose

for f in ARGS;


function vissekC(n)
    if n == 0
        compose(context(), polygon([(1,1), (0,1), (0, 0), (1,0)]))
    else
        t = vissekC(n - 1)
        compose(context(),
                (context(0,1/3, 1/3, 1/3), t),
                (context(1/3,0, 1/3, 1/3), t),
		(context(1/3,1/3, 1/3, 1/3), t),
                (context(1/3,2/3, 1/3, 1/3), t),
		 (context(2/3,1/3, 1/3, 1/3), t) )
    end
end




img = SVG("vissek-cross.svg", 4inch, 4(sqrt(3)/2)inch)
draw(img, compose(vissekC(parse(Int32,f)),linewidth(0.1mm)) )


end
