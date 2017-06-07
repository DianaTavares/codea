require_relative 'model.rb'
require_relative 'view.rb'

class ToDo
  def initialize
    @view = View.new
    @list = List.new
    options(1)
  end
def options(option)
    case option
    when 1
      tasks = @list.tasks
      @view.index(tasks)
    when 2
      text = @view.new_task
      task = Task.new(text)
      @list.tasks << task
      @list.save_csv
      @view.created_task(task)
    when 3
      p id = @view.delete_task
      p @list.delete_task(id)
      p @list.save_csv
    else
      puts "Nothing to do here"
      exit
    end
    option = @view.menu
    options(option)
end
end

todo = ToDo.new

