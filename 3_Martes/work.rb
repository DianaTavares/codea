bote_jelly_beans = []
colores = ["rojo", "azul", "amarillo" , "verde"]
p colores.sample
p colores.sample
p colores.sample
20.times do 
    bote_jelly_beans << colores.sample
end

p bote_jelly_beans

bote_jelly_beans.reject! { |jelly_bean| jelly_bean == "rojo" }

p bote_jelly_beans.include?("rojo") == false