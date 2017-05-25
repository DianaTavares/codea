=begin
Crea el método total_between_age que recibe como parámetros:

Un Array con edades
Edad mínima (min_age)
Edad máxima (max_age)
Y regresa cuantas personas del Array tienen edad entre min_age y max_age.
=end

def total_between_age (a, min_age, max_age)
  a.count {|x| x>=min_age && x<=max_age}
end
# Pruebas
p total_between_age([10, 20, 30, 40, 50, 60], 20, 40) == 3
p total_between_age([18, 19, 20, 23, 24, 27], 20, 27) == 4