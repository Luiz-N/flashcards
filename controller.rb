
require_relative 'model.rb'
require_relative 'view.rb'

class FlashCardGameController

  attr_accessor :deck,:display
  def initialize(display = FlashCardGameDisplay.new, deck = Deck.new('cards.txt'))
    @display = display
    @deck = deck
  end


  def run(user_input,card)
    if user_input != "exit"
      case user_input
        # when "pass"
        #   flashcard = deck.pull_card
        #   display.definition(flashcard)
        #   answer = gets.chomp
        #   correct(answer, flashcard)
        when "options"
      	  display.game_options
        else
      	  if correct(user_input,card)
            display.correct_message
            deck.remove_card(card)
            new_card = deck.pull_card
            display.definition(new_card)
            display.prompt
            answer = gets.chomp
            run(answer,new_card) 
          else
            display.incorrect_message
            display.definition(card)
            display.prompt
            answer = gets.chomp
            run(answer,card)
          end
      end
    else 
      display.exit_message
    end
  end  

  def correct(guess,flashcard)
    guess == flashcard.term
  end

end

game = FlashCardGameController.new
game.display.welcome_message
card = game.deck.pull_card
game.display.definition(card)
game.display.prompt
guess = gets.chomp
game.run(guess,card)
