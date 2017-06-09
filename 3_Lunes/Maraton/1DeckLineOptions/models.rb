require 'csv'

class Card
  attr_reader :question
  attr_reader :options
  attr_reader :answer

  def initialize(question, options, answer)
    @question = question
    @options = option
    @answer = answer
  end
end

class Deck_cards
  attr_reader :cards
  def initialize
    @cards = read_csv
  end

  def read_csv
    content = []
    cards = []
    content = CSV.read("cartas.csv")

    for i in 0..(content.length-2)/3
      cards << Card.new(content[3*i], content[3*i+1], content[3*i+1][0])
    end
    cards
  end
end
