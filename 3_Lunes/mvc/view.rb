class View
  def initialize
  end
  def menu
    puts "welcome user"
    puts "Type 1 show all task"
    puts "Type 2 to add new task"
    puts "Type 3 to delete"
    gets.to_i
  end
  def index(tasks)
    tasks.each_with_index do |t,i|
      puts "#{i}.- #{t.text}"
    end
  end
  def new_task
    puts "Add your task"
    gets.chomp
  end
  def created_task(task)
    puts "Created Task '#{task.text}'"
  end
  def delete_task
    puts "Which id do you want to delete"
    gets.to_i
  end
end
