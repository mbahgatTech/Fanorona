class UI
  def initialize
    @board = Board.new
    @model = GameSystem.new(@board, self)
    @board_updater = BoardUpdater.new(@board)
  end

  def run_fanorona
    FanoronaLogger.log_info
    puts('Welcome to Fanorona

What would you like to do today?

1. Play a game of Fanorona
2. How to Play
3. Exit Game

')

    print '> '
    menu_option = gets.chomp

    puts

    case menu_option
    when '1'
      player_1_colour = ''
      puts 'Choose a colour for Player 1 (Enter W for white and B for Black)'
      puts
      print '> '
      selected_colour = gets.chomp
      puts
      print 'Player 1 has chosen '
      case selected_colour.downcase
      when 'b'
        puts 'Black'
        puts
        player_1_colour = :B
      when 'w'
        puts 'White'
        puts
        player_1_colour = :W
      else
        return
      end

      print 'Player 2 is '
      case player_1_colour
      when :W
        puts 'Black'
        puts
        player_2_colour = :B
      when :B
        puts 'White'
        puts
        player_2_colour = :W
      end

      @model.start_game(player_1_colour, player_2_colour)
      puts 'Here is the initial game board'
      puts
    when '2'
      print_rules
    when '3'
      puts 'Thanks for playing Fanorona! Have a great day!'
      exit
    end
  end

  def print_board
    FanoronaLogger.log_info
    @board_updater.print_game_board(@board)
    puts
  end

  def print_rules
    FanoronaLogger.log_info
    puts('
Here are the rules of Fanorona


1. Players take turns to move one of their pieces. Each turn a player is able to perform a move or capture.
   A piece can be moved along a line adjacent
2. There are two types of capture move
  a. Capture by Approach:
    i. A piece is captured by moving to an adjacent empty point so that the enemy piece is on the next point within the movement of direction
  b. Capture by Withdrawal:
    i. The piece moves away to from an adjacent empty point in the opposite direction, any opponent pieces that are adjacent behind that piece are capture
3. Multiple captures are allowed meaning the player must make multiple captures after the first one if there is one available')
  end

  def process_move(from_row, from_col, to_row, to_col)
    FanoronaLogger.log_info('')
    @model.handle_move(from_row, from_col, to_row, to_col)
  end

  def revert_move
    FanoronaLogger.log_info
    puts 'Opponent confirm undo (Y or N): '
    puts
    print('> ')
    opp_confirm_choice = gets.chomp
    case opp_confirm_choice.downcase
    when 'y'
      @model.revert_move
    when 'n'
      end_turn
    end
  end

  def forfeit
    FanoronaLogger.log_info
    @model.forfeit
  end

  def end_turn
    FanoronaLogger.log_info
    @model.end_turn
  end

  def print_current_turn
    FanoronaLogger.log_info
    player_turn = @model.whose_turn
    player_colour = player_turn.check_colour == :B ? 'Black' : 'White'

    puts "It's the #{player_colour} Player's turn"
    puts
  end

  def pick_capture_type(available_captures)
    FanoronaLogger.log_info
    return nil if available_captures.empty?

    selection = -1
    while selection.negative? || selection >= available_captures.length
      puts "> There are #{available_captures.length} available pieces to capture, which one would you like to capture"
      puts

      available_captures.each_with_index do |coords, index|
        puts "To capture the piece at #{coords[0]},#{coords[1]} enter #{index + 1}"
        puts
      end

      puts
      print '> '

      selection = gets.chomp.to_i - 1
    end

    available_captures[selection] || []
  end
end
