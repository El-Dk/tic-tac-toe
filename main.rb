# frozen_string_literal: true

require 'io/console'
require './match'
def valid_move?(move)
  move.length == 1 && move.to_i.between?(1, 9)
end

print "Player 1: "
player1 = gets.chomp
player1.strip!
print "Player 2: "
player2 = gets.chomp
player2.strip!
player1 = Player.new(player1, "X")
player2 = Player.new(player2, "O")
players = [player1, player2]
match = Match.new(player1, player2)
last_played = 1
loop do
  match.draw_board
  if last_played == 1
    last_played = 0
  else
    last_played = 1
  end
  print "#{players[last_played].name} make your move: "
  move = gets.chomp
  loop do
    break if valid_move?(move)
    
    print "ERROR! Pick a space between 1-9: "
    move = gets.chomp
  end
  move = move.to_i
  space = [2 - (move - 1) / 3, (move - 1) % 3]
  until match.available?(space)
    print "ERROR! Pick an empty space: "
    move = gets.chomp.to_i
    space = [2 - (move - 1) / 3, (move - 1) % 3]
  end
  match.make_move(last_played, space)
  if match.check_winner?(last_played) 
    match.draw_board
    puts "#{players[last_played].name} won this match!"
    players[last_played].add_win
    print "Press any key to continue..."
    STDIN.getch
    match.reset
  elsif match.tie?
    match.draw_board
    puts 'It was a Draw!'
    print 'Press any key to continue...'
    STDIN.getch
    match.reset
  end
end
