class Guesses < ActiveRecord::Migration[4.2]
  def change
    create_table :guesses do |t|
      t.belongs_to  :user
      t.belongs_to  :round
      t.belongs_to  :card
      t.boolean     :correct
      t.timestamps
    end
  end
end
