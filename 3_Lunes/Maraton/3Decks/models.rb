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
  def initialize(option)
      @option= option
      @cards = read_csv
  end

  def read_csv
    cards = []
    if @option==1
      CSV.foreach("EstadosMex.csv") do |line|
        cards << Card.new(line[0], line[1])
      end
    elsif @option==2
      CSV.foreach("America.csv") do |line|
        cards << Card.new(line[0], line[1])
      end
    else
      CSV.foreach("Europa.csv") do |line|
        cards << Card.new(line[0], line[1])
      end
    end
    cards
  end
end
