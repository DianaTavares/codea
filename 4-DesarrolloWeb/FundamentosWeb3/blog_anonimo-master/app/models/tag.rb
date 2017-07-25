class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tag_posts
  has_many :posts, through: :tag_posts
end
