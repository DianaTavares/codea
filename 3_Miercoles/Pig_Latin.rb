#Metodod para una palabra
def pig_word(word)
  if /[aeiou]/.match(word[0])
    word = word + "way"
  else
    consonants=""
    while /[^aeiou]/.match(word[0])
      consonants+=word[0]
     word[0]=''
    end
    word+=consonants
    word+="ay"
  end
  word
end

#Metodo para una frase
def pig_sentece(sentece)
  new_sentece = []
  sentece.each do |word|
    new_sentece << pig_word(word)
  end
  new_sentece
end

#aqui va el codigo!!
puts
print "Escribe lo que quieras convertir: "
text = gets.chomp
text_array = text.split

if text_array.length == 1 
  new_word = pig_word(text_array[0])
  puts
  puts "tu palabra en Pig Latin es #{new_word}"
  puts 
else
  new_sentece = pig_sentece(text_array)
  puts
  print "tu oración convertida es: "
  new_sentece.each do |word|
    print "#{word} "
  end
  puts
  puts
end





