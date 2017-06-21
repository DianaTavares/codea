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
    new_sentece << pig_word(word.dup)
  end
  new_sentece
end

#este es el controller!!, le agregue .dup a los elemetos del arreglo obtenido por ARGV porque me mardan error de "Can`t modify frozen string"
puts 
text_array = ARGV

if text_array.length == 1 
  new_word = pig_word(text_array[0].dup)
  puts new_word
  puts 
else
  new_sentece = pig_sentece(text_array)
  new_sentece.each do |word|
    print "#{word} "
  end
  puts
  puts
end





