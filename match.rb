# frozen_string_literal: true

require './player'

# Match class definition
class Match
  attr_reader :board

  def initialize(player1, player2)
    @players = [player1, player2]
    @board = Array.new(3) { Array.new(3, false) }
  end

  def check_horizontal(player)
    checked = 0
    (0..2).each do |row|
      (0..2).each do |column|
        break unless @board[row][column] == @players[player].symbol

        checked += 1
      end
      break if checked == 3

      checked = 0
    end
    checked == 3
  end

  def check_vertical(player)
    checked = 0
    (0..2).each do |column|
      (0..2).each do |row|
        break unless @board[row][column] == @players[player].symbol

        checked += 1
      end
      break if checked == 3

      checked = 0
    end
    checked == 3
  end

  def check_diagonal(player)
    diagonal1 = "#{@board[0][0]}#{@board[1][1]}#{@board[2][2]}"
    diagonal2 = "#{@board[2][0]}#{@board[1][1]}#{@board[0][2]}"
    check = "#{@players[player].symbol}#{@players[player].symbol}#{@players[player].symbol}"
    check == diagonal1 || check == diagonal2
  end

  def check_board(player)
    check_vertical(player) || check_horizontal(player) || check_diagonal(player)
  end

  def make_move(player, space)
    @board[space[0]][space[1]] = @players[player].symbol
    check_board(player)
  end
end
