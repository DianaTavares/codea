#Este ejercicio sigue le paradigma de programacióm MCV (Modelo, controlador vista) donde se crean tres archivos diferentges para cada seccion del programa. Este documento es el controlador! 


#Aquí se esta llamando a los archivos de modelo y vsta que deben estar en la misma carpeta.
require_relative 'model.rb'
require_relative 'view.rb'

class ToDo
  #al iniciar la case. se crean las instancias de las clases vista (que nos permitira mostrar lo que el usuario quiere ver) y Lista (pues la lista de actividades) options es un menu que dependiendo de los numeros, te permite realizar varias acciones en la lista de tasks, por defaul inicia en 1
  def initialize
    @view = View.new
    @list = List.new
    options(1)
  end
  #El prograa puede hacer 5 cosas:
def options(option)
    case option
      #1, mostrar la lista de todas las tareas, para eso llamamos el atributo de task de la instancia lista y se la enviamos a vista para que la imprima en pantalla.
    when 1
      tasks = @list.tasks
      @view.index(tasks)
      #2, agregar nueva task:
    when 2
      #vista manda un mensaje al usuario preguntando que quiere agregar
      text = @view.new_task
      #se crea la instancia de la nueva tarea
      task = Task.new(text)
      #se introduce esa tarea en la lista de tareas
      @list.tasks << task
      #se guarda en el csv
      @list.save_csv
      #se le informa al usuario que la tarea se ha agregado correctamentge
      @view.created_task(task)
      #opcion 3, eliminar una tarea
    when 3
      #preguntamos al usuario que quiere eliminar (debe escribir el id de la tarea)
      id = @view.delete_task
      #se elimina esa tarea de la lista
      @list.delete_task(id)
      #se guarda la nueva lista sin esa tarea
      @list.save_csv
      #Opcion 4 marcar como completa una tarea
    when 4
      #se le pregunta al usuario que tarea quiere desea marcar por medio de su id
      id = @view.complete_task
      #se llama a la funcoin que cambiara el status de la tarea completa
      task = @list.complete_task(id)
      #se muestra que la tarea ha sido marcada como completa
      @view.completed_task(task)
      #Opcion5, lo mismo que el anterior, pero para descompletar
    when 5
      id = @view.uncomplete_task
      task = @list.uncomplete_task(id)
      @view.uncompleted_task(task)
      #si introduce un numero no parte del menu se sale del programa
    else
      puts "Nothing to do here"
      exit
    end
    #mostramos la lista de las opcines del menu
    option = @view.menu
    options(option)
end
end
#creamos la instancia de la case ToDo
todo = ToDo.new

