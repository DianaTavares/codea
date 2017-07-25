class Rounds < ActiveRecord::Migration[4.2]
  def change
    create_table :rounds do |t|
      t.belongs_to  :user
      t.belongs_to  :deck
      t.integer     :num_guesses
      t.integer     :correct_guesses
      t.integer     :incorrect_guesses
      t.timestamps
    end
  end
end