require_relative('game')
require('pry')

class BigBrain
  def guess(guess_results)
    if guess_results.count == 0
      best_first_guess
    else
      best_guess_based_on_last_result(guess_results.last)
    end
  end

  private

  def best_guess_based_on_last_result(guess_result)
    @matching_combinations = matching_combinations(guess_result)
    @matching_combinations.sample
  end

  def matching_combinations(guess_result)
    combinations = @matching_combinations || Game.all_possibilities
    combinations.select do |combination|
      GuessResult.new(guess_result.guessed_colors, combination).equals(guess_result)
    end
  end

  def best_first_guess
    [:red, :red, :blue, :blue]
  end
end
