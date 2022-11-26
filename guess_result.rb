class GuessResult
  attr_reader :guessed_colors, :result

  def initialize(guessed_colors, code)
    @guessed_colors = guessed_colors
    @code = code
    @result = calculate_result
  end

  def equals(other)
    other.result[:red] == result[:red] && other.result[:white] == result[:white]
  end

  def to_s
    'Result for ' + '(' + guessed_colors.join(' ') + ')' + ' is ' + result[:red].to_s + ' red and ' + result[:white].to_s + ' white '
  end

  private

  def calculate_result
    red = 0
    white = guessed_colors.count { |color| @code.include?(color) }

    guessed_colors.each_with_index do |color, i|
      if color == @code[i]
        red += 1
        white -= 1
      end
    end

    { red: red, white: white }
  end
end
