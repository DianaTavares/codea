require "sinatra"

get "/" do 
  count_vowels("Diana Lopez")
end

def count_vowels(name)
  vowels=name.gsub(/[^aeiou]/, '')
  "My name is #{name} and it has #{vowels.length} vowels"
end