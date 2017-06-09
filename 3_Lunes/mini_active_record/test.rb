require_relative 'app'

puts "Metodo all"
p Chef.all
puts
p Meal.all
puts

puts "Metodo Where"
p Meal.where('name = ?', 'Tuna Tacos')
puts
p Chef.where('Last_name = ?', 'Kunze')
puts

puts "Metodo Find"
p Chef.find(1)
puts
p Meal.find(2)
puts

puts "Metodo Create, initialize, save, new_record?, insert!"
p chef=Chef.create({first_name: 'Mario6', last_name: 'Ramirez', email: 'xoch@gmail', phone: '913.278.6032', birthday: '1990-01-01'})
puts
p meal=Meal.create({name: 'Pechuga6 a la plancha', chef_id: 21})
puts

puts " Metodos [](attribute) y [](attribute, value)"
p chef[:first_name]=='Mario6'
p meal[:name]=='Pechuga6 a la plancha'







puts "finished"
