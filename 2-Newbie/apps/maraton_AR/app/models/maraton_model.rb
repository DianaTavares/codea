

class User < ActiveRecord::Base
  has_many :games
  has_many :decks, through: :games
  has_many :statistics, through: :games

end

class Deck < ActiveRecord::Base
  has_many :questions
  has_many :answers, through: :questions
end

class Question < ActiveRecord::Base
  belongs_to :deck
  has_many :answers
 
end

class Answer < ActiveRecord::Base
  belongs_to :question
end

class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :statistics 
  has_many :answers, through: :statistics
  has_many :questions, through: :statistics
  

end

class Statistic < ActiveRecord::Base
  belongs_to :game
  belongs_to :answer
  belongs_to :question

end