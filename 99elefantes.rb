#Tienes que escribir un programa que modele la canción de los elefantes del 1 al 99. Utiliza rangos y loops. Haz que tu programa pueda recibir el número de elefantes en el que se rome la telaraña
puts "¿Cuantos elefantes se columpian?"
num= gets.chomp.to_i
#si el usuario solo introduce 1 elefante, con ese la tela se rompio
if num==1
  p "#{num} elefante se columpiaban sobre la tela de una araña, pero la tela se rompió"
  #si el usuario introduce más de un elefante, el primer elefante es sigunlar, a partir del segundo son elefantes y con el ultimo se rompe
  elsif num>0
    p "1 elefante se columpiaba sobre la tela de una araña, como veía que resistía fueron a llamar a otro elefante."
    (2..num-1).each do |i|
    p "#{i} elefantes se columpiaban sobre la tela de una araña, como veía que resistía fueron a llamar a otro elefante."
  end
  #Si el usuario introduce cero o números negativos
  p "#{num} elefantes se columpiaban sobre la tela de una araña, pero la tela se rompió"
else
  p "no hay elefantes que quieran columpiarse"
end


