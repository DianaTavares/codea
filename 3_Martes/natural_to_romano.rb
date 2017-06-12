#convertidor de numeros naturales a romanos

def to_roman(num)
  romano = ""
  miles = num / 1000
  num = num % 1000
  centenas = num / 100
  num = num % 100
  decenas = num / 10
  unidades = num % 10
  
  #para los miles (M)
  for i in 1..miles
    romano+="M"
  end

  #Para las centenas
  if centenas == 9
    romano+="CM"
  elsif centenas >= 5
    romano+="D"
    for i in 6..centenas
      romano+="C"
    end
  elsif centenas == 4
    romano+="CD"
  else
    for i in 1..centenas
      romano+="C"
    end
  end

  #Decenas
    if decenas == 9
    romano+="XC"
  elsif decenas >= 5
    romano+="L"
    for i in 6..decenas
      romano+="X"
    end
  elsif decenas == 4
    romano+="XL"
  else
    for i in 1..decenas
      romano+="X"
    end
  end

  #Unidades
      if unidades == 9
    romano+="IX"
  elsif unidades >= 5
    romano+="V"
    for i in 6..unidades
      romano+="I"
    end
  elsif unidades == 4
    romano+="IV"
  else
    for i in 1..unidades
      romano+="I"
    end
  end
  romano
end

#Drive Code

a = to_roman(1) == "I"
b = to_roman(3) == "III"  
c = to_roman(4) == "IV"
d = to_roman(9) == "IX"
e = to_roman(13) == "XIII"
f = to_roman(14) == "XIV"
g = to_roman(944) == "CMXLIV"
h = to_roman(1453) == "MCDLIII"
i = to_roman(1646) == "MDCXLVI"


puts "|valid |input | expected | actual"
puts "|------|------|----------|-------"
puts "| #{a} |1     | I        | #{to_roman(1)}"
puts "| #{b} |3     | III      | #{to_roman(3)}"
puts "| #{c} |4     | IV       | #{to_roman(4)}"
puts "| #{d} |9     | IX       | #{to_roman(9)}"
puts "| #{e} |13    | XIII     | #{to_roman(13)}"
puts "| #{f} |14    | XIV      | #{to_roman(14)}"
puts "| #{g} |944   | CMXLIV   | #{to_roman(944)}"
puts "| #{h} |1453  | MCDLIII  | #{to_roman(1453)}"
puts "| #{i} |1646  | MDCXLVI  | #{to_roman(1646)}" 