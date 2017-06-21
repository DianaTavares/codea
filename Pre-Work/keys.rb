def keys (has)
  ar=[]
  #este metodo toma cada clave de Hash y lo asigna al arreglo ar. 
  has.each_key {|key| ar<<key}
  ar
end

p keys({ "a" => 100, "b" => 200 })==["a","b"]
p (keys ({"perro" => "canino", "gato" => "felino"}))==["perro", "gato"]