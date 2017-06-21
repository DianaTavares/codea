#seccion de controllers 
require_relative 'models.rb'
require_relative 'view.rb'

class Maraton

  def initialize 
    @view = View.new
    @deck = Deck_cards.new
    game
  end

  def game
    correct = 0
    wrong = 0
    cards = @deck.cards
    cards.each do |card|
      question = card.question
      options = card.options
      answer = card.answer
      user_answer = @view.new_turn(question, options)
      #aqui me quede!!
      
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




