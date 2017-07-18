class CreateTasks < ActiveRecord::Migration[4.2]

  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
    end

    create_table :decks do |t|
      t.string :subject
    end

    create_table :questions do |t|
      t.belongs_to :deck, index: true
      t.string :text
    end

    create_table :answers do |t|
      t.belongs_to :question, index: true
      t.string :option
      t.boolean :status
    end

    create_table :games do |t|
      t.belongs_to :user, index: true
      t.belongs_to :deck, index: true
      t.integer :correct
      t.integer :incorrect
    end

    create_table :statistics do |t|
      t.belongs_to :game, index: true
      t.belongs_to :question, index: true
      t.belongs_to :answer, index: true
      
    end
  end
end
