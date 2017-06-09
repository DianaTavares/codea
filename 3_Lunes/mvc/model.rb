#En esta arquivo se guardan todos los modelos del programa ToDo. Los metodos y clases que hacen que el programa funcione se encuentran aqui

#las tareas se guardan en un archivo externo por tanto se guardan en el csv
require 'csv'

#tenemos dos clases, una que maneja indibiduamente a cada tarea y otra que maneja a toda la lista de tareas.
class Task
  attr_reader :text #permitimos leer el texto de la tarea
  attr_accessor :status #el estatus de la tarea puede leerse y modificarse (status es compelata (true) o sin completar)
  #e inicializa una instancia con su texto y por defaul su status es false, no completada
  def initialize(text, status = false)
    @text = text
    @status = status
  end
end

class List
  #se puyeden leer y modifiar otas las tareas contenidas en la list
  attr_accessor :tasks
  #iniciala leyendo as tareas que estan guardadas en el archivo csv
  def initialize
    @tasks = read_csv
  end
  #este metodo permite leer el archivo csv que es llamado en el metdodo de inicializar
  def read_csv
    #cada una de las tareas del archivo (que estan guardadas en renglones) se guardará en un areglo como nuna instancia independiente de task, con sus respectivos parametros. Solo las tareas compeltadas en el archivo dicedn "true", para ponerlas en falso si no tiene tru es que se pone la condicional de la row0 
    tasks = []
    CSV.foreach("todo.csv") do |row|
      tasks << Task.new(row[1], row[0] == 'true')
    end
    tasks
  end
  #giuarda en el archivo csv
  def save_csv
    #se abre el archivo y se le da permiso de escritura com 'wb', el archivo se reescrib por completo, colocando toda la lista de tareas con su status y texto
    CSV.open('todo.csv', 'wb') do |csv|
      @tasks.each do |t|
        csv << [t.status,t.text]
      end
    end
  end
  #Marcar una tarea como completada. requiere el id y cambia el status a true. Se requiere guardar la lista en csv al final
  def complete_task(id)
    task = @tasks[id]
    task.status = true
    save_csv
    task
  end
  #eliminar una tarea
  def delete_task(id)
    @tasks.delete_at(id)
  end
  #marcar una tarea como incompleta, se cambia el status a false y se guarda. 
  def uncomplete_task(id)
    task = @tasks[id]
    task.status = false
    save_csv
    task
  end
end
