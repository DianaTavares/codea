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
    content = []

    if @option==1
      content = CSV.read("EstadosMex.csv") 
    elsif @option==2
      content = CSV.read("America.csv")
    else
      content = CSV.read("Europa.csv")
    end
    for i in 0..(content.length-2)/3
      cards << Card.new(content[3*i], content[3*i+1])
    end
    cards
  end
end
