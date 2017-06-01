#Revisando algunos metodis de enumerables para arreglos

=begin
  --> detect 
  (1..100).detect  { |i| i % 5 == 0 and i % 7 == 0 }   #=> 35

  --> each_slice
  (1..10).each_slice(3) { |a| p a }
  # outputs below
  [1, 2, 3]
  [4, 5, 6]
  [7, 8, 9]
  [10]

--> Inject
(5..10).inject { |sum, n| sum + n }            #=> 45

--> sort
%w{apple pear fig}.sort_by { |word| word.length }
              #=> ["fig", "pear", "apple"]
  
  --> Grup_by
  (1..6).group_by { |i| i%3 }   #=> {0=>[3, 6], 1=>[1, 4], 2=>[2, 5]}
=end

#Strings en índices nones de un arreglo: Regresa un arreglo con los Strings en las posiciones 1, 3, 5, 7, etc.

def odd_indexed(array)
  a=[]
  array.each_with_index{ |i, index|
    if index%2!=1
      a<<i
    end
  }
  a
end



#Strings de tamaño mayor a 5: Regresa todos los Strings que tienen una longitud mayor a 4 caracteres.

def long_strings(array)
  array.find_all { |a| a.length >= 5}
end



#Primer string que empieza con 'h': Regresa el primer String que empieza con la letra 'h'.

def start_with_h(array)
  array.detect { |i| i[0]=="h"}
end



#Que todos los strings empiecen con mayúscula
def capitalize_array(array)
  array.map { |word| word.capitalize }
end



#Agrupar strings por su primera letra: Regresa un Hash donde las keys son las primeras letras de los Strings y los values son todos los Strings que empiezan con esa letra.
def group_by_starting_letter(array)
  array.group_by { |i| i[0]}
end

#Contar el número de 'r' en un string: Regresa el número de letras 'r' que tiene un string.
def number_of_r(word)
  word.count('r')
end

#pruebas
p odd_indexed(["uno", "dos", "tres", "cuatro", "cinco"]) == ["uno", "tres", "cinco"]

p long_strings(["rojo", "morado", "azul", "negro", "blanco", "naranja"]) == ["morado", "negro", "blanco", "naranja"]

p start_with_h(["manzana", "naranja", "sandia", "higo", "melon", "platano"]) == "higo"

p capitalize_array(["manuel", "juan", "rodrigo", "ana", "paola"]) == ["Manuel", "Juan", "Rodrigo", "Ana", "Paola"]

p group_by_starting_letter(["arbol", "amarillo", "angel", "burro", "barco"]) == {"a"=>["arbol", "amarillo", "angel"], "b"=>["burro", "barco"]}

p number_of_r("ferrocarril") == 4