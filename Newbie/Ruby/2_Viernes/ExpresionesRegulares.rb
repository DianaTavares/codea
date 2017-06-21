string_con_un_numero_de_cuenta = "El Cliente con el número de cuenta 1234-123-194 se encuentra en proceso de revisión de sus documentos"

string_con_un_numero_de_cuenta_no_valido = "El Cliente con el número de cuenta 4-12-12 se encuentra en proceso de revisión de sus documentos"

string_con_mas_de_un_numero_de_cuenta = "Hay que transferir los fondos de la cuenta 1234-123-123 a la cuenta 4321-321-311"

#Metodos
#Regresa true si encuentra un numero de cuenta.
def acount_number?(texto)
  m1=/(\d{4})-(\d{3})-(\d{3})/.match(texto)
  !m1.nil?
end

#Regresa un número de cuenta si existe dentro del string y nil en el caso contrario.
def finder_acount(texto)
  m1=/(\d{4})-(\d{3})-(\d{3})/.match(texto)
  !m1.nil? ? m1[0] : nil
end

#Regresa un array con los números de cuenta que existen dentro del string y un array vacío en el caso contrario.
def array_acount(texto)
  m1=/(\d{4})-(\d{3})-(\d{3})/.match(texto)
  a=[]
  if !m1.nil?
    3.times do |i|
      a<<m1[i+1].to_i
    end
  end
  a
end

#Regresa un string donde si existen números de cuenta estos tendran remplazados por "X" los primeros siete numeros. ej. "XXXX-XXX-234"
def hiden_numbers(texto)
  m1=/(\d{4})-(\d{3})-(\d{3})/.match(texto)
  a=m1[0]
  (0..a.length-4).each do |i|
      if a[i] != "-" 
      a[i]="X"
    end
  end
  a
end

#Regresa un string formateado donde cualquier número de diez dígitos seguido o si tiene puntos en vez de guiones lo regresa a su formato original donde usa guiones para dividir los diez dígitos. Si encuentra un numero de menos dígitos no debería remplazarlo.
def format(texto)
  m1=texto.gsub!(/[^\d]/, '' )
  if m1.length==10
    m1.insert(4,"-")
    m1.insert(8,"-")
  end
  m1
end

#pruebas
p acount_number?(string_con_un_numero_de_cuenta)==true
p acount_number?(string_con_un_numero_de_cuenta_no_valido)==false

p finder_acount(string_con_un_numero_de_cuenta)=="1234-123-194"
p finder_acount(string_con_un_numero_de_cuenta_no_valido)==nil

p array_acount(string_con_un_numero_de_cuenta)==[1234, 123, 194]
p array_acount(string_con_un_numero_de_cuenta_no_valido)==[]

p hiden_numbers(string_con_un_numero_de_cuenta)=="XXXX-XXX-194"

p format("El Cliente con el número de cuenta 1234194125 se encuentra en proceso de revisión de sus documentos")=="1234-194-125"

p format("El Cliente con el número de cuenta 1234.194.125 se encuentra en proceso de revisión de sus documentos")=="1234-194-125"

p format("El Cliente con el número de cuenta 1234195 se encuentra en proceso de revisión de sus documentos")=="1234195"

