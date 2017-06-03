#Clases!!

#Clase CreditCard
class CreditCard
  attr_reader :name, :number, :expiration, :cvc
  attr_accessor :status

  def initialize (name, number, expiration, cvc, status)
    @name=name
    @number=number
    @expiration=expiration
    @cvc=cvc
    @status=status
  end

  def to_s
    return "#{@name}", "#{@number}", "#{@expiration}", "#{@cvc}", "#{@status}"
  end
end

#Cinco instancias de CreditCard y un array con los 5 objetos
cards=[]
cards<<CreditCard.new('Amex', '2345673444', '12/15', '2354', [234, 567, 456, 567, 344])
cards<<CreditCard.new('ScotiaBank', '2345673744', '12/16', '2845', [234, 345, 456, 567, 344])
cards<<CreditCard.new('Bancomer', '2345673444', '12/15', '2645', [234, 345, 456, 567, 344])
cards<<CreditCard.new('Serfin', '2345673454', '12/20', '1345', [234, 345, 456, 567, 344])
cards<<CreditCard.new('BanCoppel', '2345373464', '12/18', '2445', [567, 345, 456, 567, 344])

#tests 

cards.each do |card|
   puts "#{card.name} responds to:"
   puts "\tName: #{card.respond_to?(:name) == true}"
   puts "\tNumber: #{card.respond_to?(:number) == true}"
   puts "\tExpiration: #{card.respond_to?(:expiration) == true}"
   puts "\tcvc: #{card.respond_to?(:cvc) == true}"
   puts "\tGet status: #{card.respond_to?(:status) == true}"
   puts "\tSet status: #{card.respond_to?(:status=) == true}"
   puts "\n\n"
end

#método para mostrar datos de tarjetas (siguiendo los ejercicios de clase, rehuse un metodo dentro de la clase que convierte la instancia en arreglo)
cards_array=[]
cards.each do |card|
  cards_array<<card.to_s
end

cards_array.each do |i|
  i.each do |j|
    print j.ljust(15)
  end
  puts 
end
puts

#Herencia!!

#Athlete class
class Athlete
   attr_accessor :total_time, :total_distance, :speed_record
  @@total_time=0
  @@total_distance=0

  #método para validar tiempo (que sea diferente de cero)
  def valid_time(time)
    time!=0
  end

  #método para hacer ejercicio. 
 

  #método para obtener velocidad del atleta
  def speed(distance, time)

    if valid_time(time)
      @speed_record=distance.to_f/time
      @speed_record=@speed_record.round(2)
    else
      @speed_record = 0
    end

  end

end

#Runner class
class Runner < Athlete
  def initialize(distance=0, time=0)
    @distance=distance
    @time=time
    #el tiempo y distancia con la que inicia tambien se aumenta al ageneral, que es la del Atleta.
    @@total_distance+=distance
    @@total_time+=time
  end

#incrementa el tiempo y la distancia de Runner, pero tambine la del Atleta. 
   def new_workout(distance, time)
    @distance+=distance
    @time+=time
    @@total_distance+=distance
    @@total_time+=time
  end

  def run
    "Ran #{@distance} meters, time: #{@time} seconds, speed: #{speed(@distance, @time)} m/s"
  end
end

#Swimmer class
class Swimmer < Athlete
  def initialize(distance=0, time=0)
    @distance=distance
    @time=time
    @@total_distance+=distance
    @@total_time+=time
  end

  def new_workout(distance, time)
    @distance+=distance
    @time+=time
    @@total_distance+=distance
    @@total_time+=time
  end

    def swim
   "Swam #{@distance} meters, time: #{@time} seconds, speed: #{speed(@distance, @time)} m/s"
  end

end

#Cyclist class
class Cyclist < Athlete
  def initialize(distance=0, time=0)
    @distance=distance
    @time=time
    @@total_distance+=distance
    @@total_time+=time
  end

  def new_workout(distance, time)
    @distance+=distance
    @time+=time
    @@total_distance+=distance
    @@total_time+=time
  end

  def ride_bike
    "Rode Bike #{@distance} meters, time: #{@time} seconds, speed: #{speed(@distance, @time)} m/s"
  end

end


#tests

#instancias de atletas con distancia en metros
runner = Runner.new()
swimmer = Swimmer.new(50, 10)
cyclist = Cyclist.new(70, 27)

athletes = [runner, swimmer, cyclist]

athletes.each do |athlete|
  #¿qué tipo de atleta es?
  puts "#{athlete.class} responds to:"
  puts "\tAthlete speed: #{athlete.respond_to?(:speed) == true}"
  puts "\tGet Athlete time: #{athlete.respond_to?(:total_time) == true}"
  puts "\tSet Athlete time: #{athlete.respond_to?(:total_time=) == true}"
  puts "\tSpeed record: #{athlete.respond_to?(:speed_record) == true}"
  puts "\tGet Distance: #{athlete.respond_to?(:total_distance) == true}"
  puts "\tSet Distance: #{athlete.respond_to?(:total_distance=) == true}"
  puts "\trun method: #{athlete.respond_to?(:run) == true}" if athlete == runner
  puts "\tswim method: #{athlete.respond_to?(:swim) == true}" if athlete == swimmer
  puts "\tride_bike method: #{athlete.respond_to?(:ride_bike) == true}" if athlete == cyclist
  puts "\n\n"
end

#test for runner

#test para runner con distancia = 0
p runner.run == "Ran 0 meters, time: 0 seconds, speed: 0 m/s"
#test para runner al hacer ejercicio, incrementa distancia = 20 metros y tiempo = 7 segundos
runner.new_workout(20, 7) 
#test para runner con distancia = 20 metros y tiempo = 7 segundos
p runner.run == "Ran 20 meters, time: 7 seconds, speed: 2.86 m/s"

#test para swimmer con distancia = 50
p swimmer.swim == "Swam 50 meters, time: 10 seconds, speed: 5.0 m/s"


#RACE CARS!!!!

#RaceCar class
class RaceCar

  LAPDISTANCE=100
  attr_accessor :time
  attr_accessor :name
  
  def initialize(name, time)
    @name=name
    @time=time
  end

  #método para obtener velocidad promedio
  def average_speed
    @speed=LAPDISTANCE/@time.to_f
    @speed=@speed.round(2)
  end

  #método que muestra nivel de cada race car
  def level
    a=""
    if average_speed < 10
      a="Principiante"
    elsif average_speed < 13
      a="Medio"
    else 
      a="Normal"
    end
    a
  end

end

#Team class
class Team 
attr_accessor :team
  def initialize (team)
    @team=team
  end

  #método para agregar nuevo race car
  def new_member(new_car)
    @team<<new_car
  end
 
  #método para calcular promedio de velocidad del equipo
  def average_speed_of_team
    a=0 #donde sumare las velocidades
   @team.each do |i|
    a+=i.average_speed
   end
   a / team.length
  end

end

#método para buscar race car
def search(name, team_number)
  #team_number es una instancia de la clase Team, por lo que team_number.team le da acceso a cada integrante del equipo llamando a la variable de la clase
  a="" #aqui guardo el string con el mensaje
  team_number.team.each do |i|
    if i.name==name
      a="#{name} is a racer"
    else
      a="#{name} is not a racer of this team"
    end
  end
  a
end

#método para generar la tabla
def table(array)
  tab=[]
  array.each do |i|
    tab<<[i.name, i.level] 
  end
  tab
end

#método para mostrar nombre y nivel del race car
def car_level(array)
  print "name".center(20), "|".center(20), "level".center(20) 
  puts " "
  puts"---------------------------------"*2
  array.each do |i|
    print "#{i[0]}".center(20), "|".center(20), "#{i[1]}".center(20) 
    puts " "
  end
end


#instancias de RaceCar
car1=RaceCar.new('Force', 10.5)
car2=RaceCar.new('Passwater', 12)
car3=RaceCar.new('Cuck', 9.8)
car4=RaceCar.new('Banjo', 9)
car5=RaceCar.new('Power', 15)
car6=RaceCar.new('Tanque', 11.65)


#tests
puts
p "Resultados RACE CAR"
puts

p "car1: #{car1.average_speed} m/s"
#ej. car1: 9.5 m/s
p "car2: #{car2.average_speed} m/s"
#ej. car2: 12.01 m/s
p "car3: #{car3.average_speed} m/s"
#ej. car3: 10.65 m/s
p "car4: #{car4.average_speed} m/s"
#ej. car4: 11.0 m/s
p "car5: #{car5.average_speed} m/s"
#ej. car5: 10.15 m/s
p "car6: #{car6.average_speed} m/s"
#ej. car6: 15.51 m/s

#create a team of cars 
team1 = [car1, car2, car3, car4, car5]
team_one = Team.new(team1)


#test para buscar race car en equipo team_one
puts 
puts 
p search("Power", team_one) == "Power is a racer"

p "Promedio de velocidad del equipo"
#calculate average speed of team
p team_one.average_speed_of_team
#ej. 10.66 
puts
p "tabla de resultados"
puts
#genero la tabla
car_level(table(team1))

puts
puts
puts

# => PLAYLIST

class Playlist
  attr_reader :name, :songs #con esto se lee el nombre de la playlist y las canciones
  @@i=0 #contador de la cnacion en la que se esta
  def initialize (name, songs)
    @name = name
    @songs = songs

  end

  def number_songs
    @songs.length
  end

  def add_song(new_song)
    @songs << new_song
  end

  def next_song
    if @@i==songs.length-1
      @@i=0
      @songs[@@i]
    else
      @@i+=1
      @songs[@@i]
    end
  end

  def actual_song
    @songs[@@i]
  end
end

playlist1=Playlist.new("Caifanes",["Viento", "La negra Tomasa", "Cuando la sangre galopa", "Miedo", "Detras de los cerros", "Quisiera ser alcohol"])
#verificanod acceso al nombre de la playlist
p playlist1.name

#verificando las canciones de la play list
p playlist1.songs

#numero de cancines
p playlist1.number_songs
#agregando una cancion
p playlist1.add_song("Te lo pido por favor")

#verficando la canción actual
p playlist1.actual_song

#cambiando a la siguiente canción y verificando que regrese al inicio
puts
p playlist1.next_song
p playlist1.next_song
p playlist1.next_song
p playlist1.next_song
p playlist1.next_song
p playlist1.next_song
p playlist1.next_song
p playlist1.next_song



