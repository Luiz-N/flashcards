

class FlashCardGameDisplay

  def welcome_message
    puts "Welcome to FlashCards!  To play, enter a guess for the term of each definition presented.  Type 'options' to learn about more things you can do!"
    puts
  end

  def prompt
    print "Guess: "
  end

  def definition(flashcard)
    puts "Definition:\n#{flashcard.definition}"
    puts "----------------------------------------------------------------"
  end

  def exit_message
    puts "Thanks for playing FlashCards!"
  end

  def correct_message
    puts
    puts "Nice job! Now try this one:"
    puts
  end

  def incorrect_message
    puts
    puts "Sorry, that's not it.  Try again."
    puts
  end

  def game_options
    "Type pass to skip this card or exit to quit"
  end

end

# hi = FlashCardDisplay.new
# hi.welcome_message
