class RaceCar
  def initialize(brand, model)
    #variable de instancia 1
    @brand = brand
    #variable de instancia 2
    @model = model
  end

  #comportamiento 1
  def acelerar
    puts "Acelerando"
  end

  #comportamiento 2
  def frenar
    puts "Frenando"
  end

  #otros comportamientos...

end

#instancias de RaceCar
speedy = RaceCar.new
bolt = RaceCar.new("mercedez", "1997")
#método de instancia 'acelerar'
speedy.acelerar
bolt.acelerar
#método de instancia 'frenar'
speedy.frenar
bolt.frenar