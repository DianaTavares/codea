class CreateGames < ActiveRecord::Migration[4.2]
  def change
    create_table:games do |t|
      t.string :player1
      t.string :player2
      t.string :winner
      t.integer :score
    end
  end
end
