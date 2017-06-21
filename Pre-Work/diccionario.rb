=begin
Escribe un programa llamado diccionary_sort que pida al usuario capturar las palabras que quiera (una palabra por línea) y para finalizar la captura tenga que presionar "enter".

Deberás utilizar un array para guardar las palabras.

Una vez que el usuario presiona "enter" el programa deberá arrojar la lista de palabras en orden alfabético.
=end
def diccionary_sort()
  ar=[]
  a="."
  while a!=""
    p 'Escribe otra palabra(o presiona "enter" para finalizar):'
    a=gets.chomp
    ar<<a
  end
  #elimina el ultimo valor del arreglo, que es el enter para salir del while
  ar.pop() 
  # .sort_by acomoda los elementos de un arreglo por  orden alfabetico, entre {} tiene el metodo downcase para que primero los convierta en minusculas, luego los acomode, pero al guardar los elementos en ar2, los guarde con el formato con el que el usuari las introdujo
  ar2=ar.sort_by{|i| i.downcase}
  p "Felicidades! Tu diccionario tiene #{ar.length} palabras"
  #Este metodo me ayuda a imprimir cada elemento del arreglo en otra linea y sin las comillas
  ar2.each {|x| puts x}
end

diccionary_sort
