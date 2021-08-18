# frozen_string_literal: true

# Player class definition
class Player
  attr_reader :name, :symbol, :wins

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @wins = 0
  end

  def add_win
    @wins += 1
  end

  def reset(name, symbol)
    @name = name
    @symbol = symbol
    @wins = 0
  end
end
