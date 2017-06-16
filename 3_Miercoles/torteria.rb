class Orden

  def initialize (tortas)
    @tortas = tortas
  end

  def tiempo_torta
    orden_tiempo = []
    t_cubana = 8
    t_alemana = 16
    t_bisteck = 14

    @tortas.each do |torta|
      if torta == "cubana"
        orden_tiempo << [torta, t_cubana]
      elsif torta == "alemana"
        orden_tiempo << [torta, t_alemana]
      else 
        orden_tiempo << [torta, t_bisteck]
      end
    end
    orden_tiempo
  end
end

class Horno
  attr_reader :tiempo
  def initialize (orden_tiempo)
    @orden_tiempo = orden_tiempo
    @tiempo = meter_horno
  end

  def meter_horno
    tiempo = 0
    @orden_tiempo.each do |torta|
      tiempo += torta[1]
    end
    tiempo /=@orden_tiempo.length
  end
end

class Tortas_listas
  attr_reader :orden_a_entregar
  def initialize (orden_tiempo, tiempo_horno)
    @orden_tiempo = orden_tiempo
    @tiempo_horno = tiempo_horno
    @orden_a_entregar = estado_tortas
  end

  def estado_tortas
    orden_a_entregar=[]
    @orden_tiempo.each do |torta|
      if @tiempo_horno < torta[1]*0.4
         orden_a_entregar << [torta[0], "cruda"]
      elsif @tiempo_horno < torta[1]*0.8
        orden_a_entregar << [torta[0], "casi lista"]
      elsif @tiempo_horno < torta[1]*1.05
        orden_a_entregar << [torta[0], "Lista!"]
      else 
        orden_a_entregar << [torta[0], "quemada :("]
      end
    end
    orden_a_entregar
  end
end


orden_tortas = Orden.new(["alemana", "alemana", "cubana", "bisteck", "cubana", "bisteck"])
orden_tiempo = orden_tortas.tiempo_torta
tiempo_horno = Horno.new(orden_tiempo).tiempo
tortas_finales = Tortas_listas.new(orden_tiempo, tiempo_horno).orden_a_entregar
puts
puts "-"*40
puts "estado final de las Tortas".center(40)
puts "-"*40
tortas_finales.each do |torta|
  puts "La torta #{torta[0]} quedo #{torta[1]}"
end
puts



