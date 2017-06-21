#crear un método que simplemente imprima la representación de un tablero de ajedrez. Representa las fichas por su nombre y los colores con una letra por ejemplo: (Torre-B, Caballo-B, Alfil-B, Reina-B, Rey-B y Peón-B).
def piezas (color)
  fichas_dobles=["Torre", "Caballo", "Alfil"]
  reyes=["Rey", "Reina"]
  a=[]
  b="-#{color}"
  fichas_dobles.each do |j|
    a<<j+b
  end
  reyes.each do |j|
   a<<j+b
  end
  fichas_dobles.reverse.each do |j|
    a<<j+b
  end
  a
end
def peones (color)
  a=[]
  (0..7).each do 
    a<<"Peón-#{color}"
  end
  a
end
def espacios (num)
  a=[]
  (0..7).each do |i|
    i%2!=num ? a<<'b' : a<<'n' 
  end
  a
end   

tablero=[]

tablero<<piezas("B")
tablero<<peones("B")
tablero<<espacios(1)
tablero<<espacios(0)
tablero<<espacios(1)
tablero<<espacios(0)
tablero<<peones("N")
tablero<<piezas("N")


tablero.each do |i|
  i.each do |j|
    print j.ljust(15) 
  end
  puts 
end



