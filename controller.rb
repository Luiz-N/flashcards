
require 'model.rb'
require 'view.rb'

class FlashCardGameController

  attr_accessor :deck,:display
  def initialize(display = FlashCardGameDisplay.new, deck = FlashCardDeck.new)
    @display = display
    @deck = deck
  end

  private

  def run(user_input,card)
    until user_input == "exit"
      case user_input
        when "pass"
          flashcard = deck.pull_card
          display.definition(flashcard)
          answer = gets.chomp
          correct(flashcard,answer)
        when "options"
      	  display.game_options
        else
      	  if correct(user_input,card)
            display.correct_message
            puts
            deck.remove_card(flashcard)
            new_card = deck.pull_card
            display.definition(new_card)
            answer = get.chomp
            run(answer,new_card)
          else
            display.incorrect_message
            answer = gets.chomp
            run(answer,flashcard)
          end
      end
    display.exit_message
    end 
  end

  def correct(guess,flashcard)
    guess == flashcard.term
  end

end

game = FlashCardGameController.new
game.display.welcome_message
puts
card = game.deck.pull_card
puts display.definition(card)
display.prompt
guess = gets.chomp
game.run(guess,card)
