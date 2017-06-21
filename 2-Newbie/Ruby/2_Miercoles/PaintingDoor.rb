#Painting A Door
#Crea el método spray_paint que pueda ser llamado sobre una instancia y modifique el color de la puerta. Haz pasar la prueba.

class Door
  def initialize(color='red')
    @color=color
  end

  def spray_paint(color)
    @color=color.capitalize
    "The #{@color} door looks great!"
  end
end

big_door=Door.new
#test
p big_door.spray_paint('yellow') == "The Yellow door looks great!"