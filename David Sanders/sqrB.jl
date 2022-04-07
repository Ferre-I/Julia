function B(s,n)
            x=2; 
            for i in 1:n
              x= 0.5(x+(s/x))
	      println(x)
            end
        return x
end
