
=begin 
Primera Letra De Cada Palabra

Crea el método first_letters que recibe como parámetro una oración y regresa dentro de un array las primeras letras de cada palabra de la oración.
=end

def first_letters (word)
  #separa el string en palabras dentro de un arreglo con split
  a=word.split
  b=[]
  #guardo en un nuevo arreglo la primera letra de cada string
  a.each do |i|
    b<<i[0]
  end
  b
end
p first_letters("Hoy es miércoles y hace sol") == ["H", "e", "m", "y", "h", "s"]
p first_letters("tienes ocho candados indios nuevos omega") == ["t", "o", "c", "i", "n", "o"]

