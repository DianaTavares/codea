#seccion de controllers 
require_relative 'models.rb'
require_relative 'view.rb'

class Maraton

  def initialize 
    @view = View.new
    choose_deck
  end

  def choose_deck
    option = @view.options
    option = option.to_i
    if (1..3) === option
      @deck = Deck_cards.new(option)
      game
    else
      puts "No corresponde a una de las opciones, fin del juego"
    end
  end

  def game
    correct = 0
    wrong = 0
    cards = @deck.cards
    cards.each do |card|
      question = card.question
      answer = card.answer
      user_answer = @view.new_turn(question)
      if user_answer==answer
        correct+=1
        compar = true
      else
        wrong+=1
        compar = false
      end
      @view.evaluated_answer(compar)
    end
    @view.game_over(correct, wrong)
  end
end

juego= Maraton.new




