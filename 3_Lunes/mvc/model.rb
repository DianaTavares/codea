require 'csv'

class Task
  attr_reader :text
  def initialize(text, status = false)
    @text = text
    @status = status
  end
end

class List

  attr_accessor :tasks

  def initialize
    @tasks = read_csv
  end

  def read_csv
    tasks = []
    CSV.foreach("todo.csv") do |row|
      tasks << Task.new(row[0])
    end
    tasks
  end
  def save_csv
    CSV.open('todo.csv', 'wb') do |csv|
      @tasks.each do |t|
        csv << [t.text]
      end
    end
  end
  def delete_task(id)
    @tasks.delete_at(id)
  end
end
