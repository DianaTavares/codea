#Removiendo vocales
def vowels (words)
  words.map do |i|
    #Metodo .gsub, con un ! para que modifique la misma variable. Cambia los caracteres de la derecha, por el caracter de la izquierda.
    i.gsub!(/[a,e,i,o,u]/, '')
  end
end

p vowels(["banana", "carrot", "pineapple", "strawberry"]) == ["bnn", "crrt", "pnppl", "strwbrry"]

#Suma de numeros
def get_sum(n1,n2)
  sum=0
  if n1==n2
    sum=n1
  elsif n2<n1
     (n2..n1).each do |i|
      sum+=i 
    end
  else
    (n1..n2).each do |i|
      sum+=i
    end
  end
  sum
end
#pruebas
p get_sum(1, 0) == 1
p get_sum(1, 2) == 3
p get_sum(0, 1) == 1
p get_sum(1, 1) == 1
p get_sum(-1, 0) == -1
p get_sum(-1, 2) == 2

#Palabras y caracteres
def char_word_counter(word)
  "This sentence has #{word.split.length} words & #{word.strip.length-word.split.length+1} characters"
#perdon, no pude encontrar un metodo que removiera los espacios en blanco de un string, .split solo funciona para espacios al inicio y al final, por eso recurri a restarle al numero de caracteres - el numero de palabras +1
end
#pruebas
p char_word_counter("This is a sentence") == "This sentence has 4 words & 15 characters"
p char_word_counter("This easy") == "This sentence has 2 words & 8 characters"
p char_word_counter("This is a very complex line of code to test our program") == "This sentence has 12 words & 44 characters"
p char_word_counter("And when she needs a shelter from reality she takes a dip in my daydreams") == "This sentence has 15 words & 59 characters"

#Buscando Hashes
def food_group(food)
  a=""
  b=[]
  c=[]
  food_groups = {
    "grano" => ['Arroz','Trigo', 'Avena', 'Cebada', 'Harina'],
    "vegetal" => ['Zanahoria', 'Maiz', 'Elote', 'Calabaza', 'Papa'],
    "fruta" => ['Manzana', 'Mango', 'Fresa', 'Durazno', 'Piña'],
    "carne" => ['Res', 'Pollo', 'Salmon', 'Pescado', 'Cerdo'],
    "lacteo" => ['Leche', 'Yogurt', 'Queso', 'Crema']
    }
    #guardo todos los valore en el arrego b
  food_groups.each_value {|value| b<<value}
    #comparo cada elemento del arreglo b con la food y si son iguales, busco a que llave pertenece del hash ese valor.
  b.each do |j|
    j.each do |i|
      if i==food
        c=j
        a=food_groups.key(c)
      end
    end
  end
  a="comida no encontrada" if a==""
  a
end
# Driver code
    p food_group('Crema') == "lacteo"
    p food_group('Res') == "carne"
    p food_group('Piña') == "fruta"
    p food_group('Caña') == "comida no encontrada"






