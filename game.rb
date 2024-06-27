require './players.rb'
require './questions.rb'

class Game
  def initialize
    @players = []
    @current_player_index = 0
  end

  def add_player(player)
    @players << player
  end

  def current_player
    @players[@current_player_index]
  end

  def next_turn
    @current_player_index = (@current_player_index + 1) % @players.size
  end

  def play_loop
    player1 = Player.new('Player 1')
    player2 = Player.new('Player 2')

    add_player(player1)
    add_player(player2)

    while @players.any?(&:alive?)

      question = Question.new
      puts "#{current_player.name}: #{question.ask_question}"

      answer = gets.chomp

      if question.correct_answer?(answer)
        puts "#{current_player.name}: Yes! You are correct!"
        puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
      else
        current_player.lose_life
        puts "#{current_player.name}: Seriously? No!"
        puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
      end

      if !current_player.alive?
        puts " ----- GAME OVER -----"
        puts "#{current_player.name} wins!"
        break
      end

      puts "----- NEW TURN ------"
      next_turn
    end
  end
end