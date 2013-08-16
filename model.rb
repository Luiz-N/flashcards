# require "controller.rb"
class Flashcard
  attr_reader :definition, :term 
  def initialize(definition, term)
    @definition = definition.delete("\n")
    @term = term.delete("\n")
  end
end

class Deck
  # attr_reader
  def initialize(filename)
    @stack = []
    @filename = filename
    grabcards
  end

  def grabcards
    File.open(@filename, "r").each_slice(2) { |row|
      definition = row[0]
      term = row[1]
      @stack << Flashcard.new(definition, term)
    }
    p @stack.length
  end

  def pull_card
    random_card = rand(0..@stack.length)
    # p @stack[random_card]
    card = @stack[random_card]
  end

  def remove_card(card)
    @stack.delete(card)
    save
  end

  def save
    File.open(@filename, "w") { |file|  
      @stack.each do |row|
        file << "#{row.definition}\n#{row.term}\n"
      end
      @stack.length
    }
  end


end


# deck = Deck.new("cards.txt")

# deck.grabcards
# # card = deck.pull_card
# 20.times { 
# card = deck.pull_card
# deck.remove_card(card)
#  }

