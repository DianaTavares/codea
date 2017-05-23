#Intenta escribir un método llamado canonical que reciba una palabra y la regrese en un formato especifico el cual, si comparas dos anagramas después de mandados a este método sean iguales.

def canonical(word)
  word.chars.sort_by(&:downcase).join
end

def are_anagrams?(word1, word2)
  canonical(word1) == canonical(word2)
end
#Pruebas
p are_anagrams?("roma", "amor")
p are_anagrams?("amor", "rema")

#Mas dificultad
#Ahora intenta crear un método que se llame anagrams_for el cual deberá recibir una palabra y un arreglo de palabras (un diccionario) y regresar un arreglo de las palabras que sean anagramas de esa palabra o un arreglo vació si no encuentra ninguna.

def anagrams_for(word, ar)
  ar2=[]
  ar.each do |i|
    if are_anagrams?(i,word)
      ar2<<i
    end
  end
  ar2
end
#Pruebas
p anagrams_for("roma",["amor", "remo", "ramo", "azul", "mora"])==["amor", "ramo", "mora"]
p anagrams_for("azul", ["mañana", "si"])==[]

