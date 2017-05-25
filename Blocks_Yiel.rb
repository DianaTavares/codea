#Ejercicio - Block & Prime

def prime(n)
   require 'prime'
   yield n
end
#Test con los primeros 10 primos
prime(10){|i| p Prime.first(i)}
puts

#Ejercicio - Block & Yield

#método para calcular el promedio de calificaciones
def average_grade(grades)
  count = 0
  average = 0
  puts "------------Time started----------"
  ti=Time.now
  puts "Start time: #{ti}"
  puts
  a= yield grades
  p "Average is: #{a}"
  puts 
  te=Time.now
  puts
  puts "End time: #{te}"
  puts "------------Time finished----------"
  puts "Result: #{te-ti} seconds"

end

average_grade([10,2,5,8,9,10,6]){|a| a.inject { |sum, n| sum + n } / a.length.to_f}