

class FlashCardDisplay

  def welcome_message
    puts "Welcome to FlashCards!  To play, enter a guess for the term of each definition presented.  Type 'options' to learn about more things you can do!"
  end

  def prompt
    puts "Guess: "
  end

  def definition(flashcard)
    puts "Definition: #{flashcard.definition}"
  end

  def exit_message
    puts "Thanks for playing FlashCards!"
  end

  def correct_message
    puts "Nice job! Now try this one:"
    puts
  end

  def incorrect_message
    puts "Sorry, that's not it.  Try again."
    puts
  end

end

hi = FlashCardDisplay.new
hi.welcome_message