class TasksController
  def initialize(args)
    @view = TasksView.new
    @new_task = args[1]
    options(args[0])
  end

  def options(value)
    if value== "index"
      index
    elsif value == "add"
      add
    elsif value == "delete"
      delete
    elsif value == "complete"
      complete
    else
      @view.error
    end
  end


  def index
    @view.index(Task.all)
  end
    
  def add
    Task.create(status: false, task:"#{@new_task}")
    @view.create
    index
  end

  def delete
    index
    task = Task.find(@view.delete)
    task.destroy
    @view.update
    index
  end

  def complete
    index
    task = Task.find(@view.complete)
    task.status = true
    task.save
    @view.update
    index
  end
end
