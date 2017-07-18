# Este archivo sirve para correr código que te permita 
# rellenar tu base de datos con información. 
require 'csv'

#para obtener la canonica (ordanar las letras de un palabra por orden alfabetico) de una palabra
def canonica(word)
	if word.length > 1
  		word.chars.sort_by(&:downcase).join
  	else 
  		word
  	end
end

#guardamos las palabras del archivo word.csv en la base de datos junto con su canonico

CSV.foreach("words.csv") do |n|
	# p canonical(n[0])
    Word.create(word: n[0], canonical: canonica(n[0]))
end

