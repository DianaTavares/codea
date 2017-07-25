class Post < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tag_posts
  has_many :tags, through: :tag_posts
end
