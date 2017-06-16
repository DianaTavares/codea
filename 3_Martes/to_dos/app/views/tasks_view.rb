class TasksView
  # Recuerda que la única responsabilidad de la vista es desplegar data al usuario

  def index(tasks)
    puts
    puts "lista de todas las tareas"
    tasks.each do |objeto|
      status = objeto.status ? 'X' : ' '
      puts "#{objeto.id}.- [#{status}] #{objeto.task}"
    end
  end

  def create
    puts "Tu tarea se ha agregado satisfactoriamente!!"
  end

  def delete
    puts
    puts "De la lista de tareas mostrada arriba, escribe el ID de la tarea que quieres eliminar "
    STDIN.gets()
  end

  def update
    puts "Tu cambio se ha realizado correctamente"
  end

  def complete
    puts
    puts "Escribe el ID de la tarea que quieres completar "
    STDIN.gets()
  end

  def error
    puts "opcion no valida"
  end
end