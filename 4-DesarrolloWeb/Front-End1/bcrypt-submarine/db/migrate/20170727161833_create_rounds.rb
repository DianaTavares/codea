class CreateRounds < ActiveRecord::Migration[4.2]
  def change
    create_table :rounds do |t|
      t.belongs_to :user, index: true
      t.integer :destroyed_subs
      t.string :result
    end
  end
end
