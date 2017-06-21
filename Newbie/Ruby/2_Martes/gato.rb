=begin
Daremos un nuevo paso en nuestro juego de Gato. Ya teniendo el tablero y sabiendo crearlo ahora queremos crear un método que cree tableros, pero que cada vez estos sean diferentes.

Existen muchas maneras para crear este método
Crea dos implementaciones diferentes
=end

def gato1
  a=Array.new(3){Array.new(3)}
  (0..2).each do |i|
    (0..2).each do |j|
     b=rand(2)
      b==0 ? a[i][j]="x" : a[i][j]="o"
    end
  end 
  a
end

def imprimir_table(tablero)
  tablero.each do |i|
    i.each do |j|
      print j.ljust(5) 
    end
    puts 
  end
end

#Intenta que la segunda sea compacta, elegante y COMPRENSIBLE.
def gato2
  c=Array.new(3){Array.new(3){['x','o'].sample}}
end
p 'primer forma'
imprimir_table(gato1)
puts
p 'segunda forma'
imprimir_table(gato2)

#Seguramente tus métodos estan bien pero no son muy realistas, crea un método que contenga el numeró real de "X" y "O". Cinco y cuatro dependiendo con cual empieces y piensa también en como crear una prueba que garantice que esto suceda.

def gatoReal
  #inicio es para saber con que inicio el juego. Lo inicie en cero pero en cuanto entre al ciclo adquirira su valor real.
  inicio=0
  a=Array.new(3){Array.new(3)}
  cont1=0 #contador para la letra de inicio
  cont2=0 #contador para la segunda letra
  (0..2).each do |i|
    (0..2).each do |j|
      b=rand(2)
      b==0 ? valor="x" : valor="o"
      inicio=b if i==0 && j==0 
      #condicion para la letra inicial
      if b==inicio && cont1<=4
        a[i][j]=valor
        cont1+=1
      #condicion para la otra letra
      elsif b!=inicio && cont2<=3
        a[i][j]=valor
        cont2+=1
      elsif cont1>4 || cont2>3
        #cambio valor a la otra letra
        b==0 ? valor="o" : valor="x"
        a[i][j]=valor
      end
    end
  end
  a
end

puts
p 'El que es realista'
imprimir_table(gatoReal)

#Convertir nested arrays en hashes
#Intenta convertir la tabla del ejercicio pasado en un array donde cada persona sea un hash. Para ayudarte existe un método que facilita este proceso pero requiere que tu array de arrays este en cierto formato.




