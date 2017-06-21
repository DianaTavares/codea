#Calcular la moda de una lista de Números

def mode (ar)
  ar2=[]
  num=0
  #este metodo busca cual es la mayor frecuencia en el arreglo y lo guarda en la variable num
  ar.each do |i|
    #.cont(i) cuenta en el arreglo cuantos elementos tienen el valor de i
    if ar.count(i) >num
      num=ar.count(i)
    end
  end
  #Guarda en el nuevo arrelgo los numeros que tienen la mayor frecuencua
  ar.each do |i|
    if ar.count(i) == num
      ar2<<i
    end
  end

  ar2.uniq #devuelve los elemetos que son unicos en el arreglo

end

# Pruebas
p mode([1, 2, 2, 3]) == [2]
p mode([1, 2, 2, 3, 3, 4]) == [2, 3]
p mode([1, 2, 3]) == [1, 2, 3]
p mode([0, 1, 2, 3, 4, 0]) == [0]

