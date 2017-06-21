#Número De Dudeney

#Un número de Dudeney es un número entero que es un cubo perfecto, de forma que la suma de sus dígitos da como resultado la raíz cúbica del número.

def dudeney_number?(num)
  b=[]
  c=num #para conservar el valor original
  #Separamos el numero en sus digitos
  while num>0
    b<<num%10
    num/=10
  end
  #sumamos sus digitos
  a=b.inject{|m,i| m+=i}

  #preguntandonos si la suma de sus digitos es su raiz exacta o no del numero dado (que guardamos en c)
  a**3==c ? true : false
end

p dudeney_number?(1) == true
p dudeney_number?(125) == false
p dudeney_number?(512) == true
p dudeney_number?(1728) == false
p dudeney_number?(5832) == true