require 'csv'

class Card
  attr_reader :question
  attr_reader :answer

  def initialize(question, answer)
    @question = question
    @answer = answer
  end
end

class Deck_cards
  attr_reader :cards
  def initialize
    @cards = read_csv
  end

  def read_csv
    cards = []
    CSV.foreach("cartas.csv") do |line|
      cards << Card.new(line[0], line[1])
    end
    cards
  end
end
