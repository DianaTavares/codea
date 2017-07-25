class CreateTagPosts < ActiveRecord::Migration[4.2]
  def change
    create_table :tag_posts do |t|
      t.belongs_to    :tag
      t.belongs_to    :post
    end
  end
end
