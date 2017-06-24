=begin
	
Escribe un método llamado linear_search que tome como argumento un número y un arreglo. Este método debe regresar el índice del primer elemento que sea igual al valor del número, revisando dentro del arreglo cada valor secuencialmente. En caso de no encontrar el número debe regresar nil.

No podrás utilizar métodos de Array ni sus enumerables (each, map, etc ), si no que debes de utilizar iteradores como for while o until. El único método que puedes utilizar es: Array#[]

=end

def binary_search (num, array)

	number_certer=array[array.lenght/2]
	index_number_center=array.lenght/2
	if num > 

end

#pruebas
p binary_search(1, [1]) == 0
p binary_search(4, [1,2,3]) == nil
p binary_search(4, [1,2,3,4,5]) == 3
p binary_search(6, [1,2,3,4,5,6,7,8,9]) == 5
p binary_search(2, [1,2,3,5,6,7,8,9,10,11]) == 1
p binary_search(5, [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]) == 4