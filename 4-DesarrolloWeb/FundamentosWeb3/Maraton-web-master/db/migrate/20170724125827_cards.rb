class Cards < ActiveRecord::Migration[4.2]
  def change
    create_table :cards do |t|
      t.string      :question
      t.string      :option_1
      t.string      :option_2
      t.string      :option_3
      t.integer     :correct_option
      t.belongs_to  :deck
      t.timestamps
    end
  end
end
