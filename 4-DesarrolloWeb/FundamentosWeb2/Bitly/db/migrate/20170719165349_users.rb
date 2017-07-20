class Users < ActiveRecord::Migration[4.2]
  def change
  	create_table :urls do |t|
  		t.string :url
  		t.string :short_url
  		t.integer :counter, :default => 0
  	end

  end
end
