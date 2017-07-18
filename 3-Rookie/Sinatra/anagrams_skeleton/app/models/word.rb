class Word < ActiveRecord::Base

	def self.canonica (word)
 		if word.length > 1
  			word.chars.sort_by(&:downcase).join
  		else 
  			word
  		end
	end
  
 	def self.anagrams (word)
 		canonica_word = self.canonica(word)
 		lista = Word.where(:canonical => canonica_word)
 	end
end
