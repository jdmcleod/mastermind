require_relative('big_brain')
require_relative('guess_result')

class Game
  TURN_COUNT = 10

  attr_reader :round, :big_brain
  attr_accessor :code, :guesses

  COLORS = [:red, :blue, :green, :yellow, :white, :black]

  def initialize
    @round = 0
    @big_brain = BigBrain.new
    @guesses = []
    @code = parse_code_from_input(print_instructions_and_get_code)
  end

  def self.all_possibilities
    @@all_possibilities ||= COLORS.repeated_permutation(4).to_a
  end

  def run
    TURN_COUNT.times do |i|
      guess = big_brain.guess(guesses)
      guess_result = GuessResult.new(guess, code)
      guesses.push(guess_result)

      puts guess_result.to_s

      if guess_result.result[:red] == 4
        puts "The Bot guessed in #{i + 1} turns! The code was: " + code.join(' ')
        break
      end

      if i == 9
        puts 'You lost'
      end
    end
  end

  private

  def parse_code_from_input(user_input_code)
    user_input_code.split.map(&:to_sym)
  end

  def print_instructions_and_get_code
    puts '|----------------------------|'
    puts '|---Welcome to Mastermind----|'
    puts '|----------------------------|'
    puts '|Type the code in the format:|'
    puts '| in the format:             |'
    puts '|`> red green blue black`    |'
    puts '|----------------------------|'
    gets.chomp
    # secret_code = []
    # 4.times { secret_code.push(COLORS.sample) }
    # secret_code
  end
end
