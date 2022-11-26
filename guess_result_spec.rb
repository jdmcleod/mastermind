require_relative('guess_result')

RSpec.describe GuessResult do
  describe '#calculate_result' do
    it 'works without doubles' do
      guess = [:red, :blue, :white, :black]
      code = [:yellow, :red, :green, :black]
      result = GuessResult.new(guess, code).result
      expect(result[:red]).to eq 1
      expect(result[:white]).to eq 1
    end

    it 'works with doubles' do
      guess = [:red, :blue, :white, :black]
      code = [:yellow, :red, :red, :blue]
      result = GuessResult.new(guess, code).result
      expect(result[:red]).to eq 0
      expect(result[:white]).to eq 2
    end

    it 'works with doubles' do
      guess = [:red, :red, :white, :black]
      code = [:yellow, :red, :white, :blue]
      result = GuessResult.new(guess, code).result
      expect(result[:red]).to eq 2
      expect(result[:white]).to eq 1
    end

    it 'works with doubles' do
      guess = [:red, :red, :white, :black]
      code = [:yellow, :red, :green, :blue]
      result = GuessResult.new(guess, code).result
      expect(result[:red]).to eq 1
      expect(result[:white]).to eq 1
    end

    it 'works with doubles' do
      guess = [:red, :red, :blue, :blue]
      code = [:blue, :blue, :yellow, :red]
      result = GuessResult.new(guess, code).result
      expect(result[:red]).to eq 0
      expect(result[:white]).to eq 4
    end
  end
end
