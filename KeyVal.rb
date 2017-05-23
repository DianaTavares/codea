=begin
Keys Y Values De Un Hash

Define un método que reciba un hash de tu elección e imprima las keys y values del hash. Crea las pruebas correspondientes para este método.
=end

def KeyVal (h)
  h.each {|key, value| puts "La llave es #{key} y su valor es #{value}"}
end

KeyVal({ "a" => 100, "b" => 200, "c" => 300, "d" => 300 })