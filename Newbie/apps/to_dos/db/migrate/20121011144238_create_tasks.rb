class CreateTasks < ActiveRecord::Migration[4.2]
  def change
    create_table :tasks do |t|
      t.boolean :status
      t.string :task
      t.timestamp
    end
  end
end
