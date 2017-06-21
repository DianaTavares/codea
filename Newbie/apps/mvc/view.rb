#en base al paradigma de programacion CMV, este programa corresponde al de vistas, aqui solo se tienen las clases y metodos que permiten la intgeraccion con el usuario preguntandole cosas y mostrandole valores y textos.

#se crea la clase vista y se inicializa vacia, ya que no guarda valores, solo imprime cosas en pantalla y envia las respuestas de los usuarios a los otros metodos.
class View
  def initialize
  end
  #imprime le menu y envia la opcion seleccionada por el usuario
  def menu
    puts "welcome user"
    puts "Type 1 show all task"
    puts "Type 2 to add new task"
    puts "Type 3 to delete"
    puts "Type 4 to complete"
    puts "Type 5 to uncomplete"
    gets.to_i
  end
  #imprime la lista de tareas junto ocn su indice (id) y su estatus con X si esta completo y vacio si no.
  def index(tasks)
    tasks.each_with_index do |t,i|
      status = t.status ? 'X' : ''
      puts "#{i}.- [#{status}] #{t.text}"
    end
  end
  #pregunta que tarea quiere agregar y regresa la rfespuesta del usuario
  def new_task
    puts "Add your task"
    gets.chomp
  end
  #imprime la tarea que se ha creado
  def created_task(task)
    puts "Created Task '#{task.text}'"
  end
  #pregunta que tarea quieres eliminar 
  def delete_task
    puts "Which id do you want to delete"
    gets.to_i
  end
  # pretgunta que tarea quiere completar
  def complete_task
    puts "Which id do you want to complete"
    gets.to_i
  end
  #envia la respuesta de que tarea ha sido copletada
  def completed_task(task)
    puts "Task '#{task.text}' is completed"
  end
  #pregunta que tarea queremos descompletar
  def uncomplete_task
    puts "Which id do you want to uncomplete"
    gets.to_i
  end
  #envia confirmacion de tarea descopletada
  def uncompleted_task(task)
    puts "Task '#{task.text}' is uncompleted"
  end
end
