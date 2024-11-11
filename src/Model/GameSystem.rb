class GameSystem
  def initialize(board, ui)
    @board = board
    @ui = ui
    @ref = Referee.new(board)
  end

  def start_game(colour1, colour2)
    FanoronaLogger.log_info
    @player1 = Player.new(colour1, true)
    @player2 = Player.new(colour2, false)
    @turn_operator = TurnOperator.new(@player1, @player2)
  end

  def end_game(winner)
    FanoronaLogger.log_info
    colour = winner.check_colour

    puts "Player #{colour} is the Winner!!"
    @ui.run_fanorona
  end

  def handle_move(from_row, from_col, to_row, to_col)
    FanoronaLogger.log_info('')
    is_valid = @ref.is_move_valid(from_row, from_col, to_row, to_col)

    return :INVALID_MOVE unless is_valid

    player = @turn_operator.whose_turn

    move_type = @ref.check_move_type(from_row, from_col, to_row, to_col, player)
    player.make_move(from_row, from_col, to_row, to_col, move_type, @board)

    multiple_captures = @ref.check_multiple_captures(player)

    unless multiple_captures
      end_turn
      return :NO_CAPTURES
    end

    :MORE_CAPTURES
  end

  def forfeit
    FanoronaLogger.log_info
    end_game(@turn_operator.whose_turn)
  end

  def end_turn
    FanoronaLogger.log_info
    @turn_operator.switch_turns(@player1, @player2) if @ref.end_turn_validate(whose_turn)
  end

  def revert_move
    FanoronaLogger.log_error('Not Implemented')
  end

  def whose_turn
    FanoronaLogger.log_info
    @turn_operator.whose_turn
  end
end
