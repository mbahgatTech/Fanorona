class GameSystem
  def initialize(board, ui)
    @board = board
    @player1 = Player.new
    @player2 = Player.new
    @ref = Referee.new
    @turn_operator = TurnOperator.new(@player1, @player2)
    @ui = ui
  end

  def start_game(colour1, colour2)
    FanoronaLogger.log_error('Not Implemented')
  end

  def end_game
    FanoronaLogger.log_error('Not Implemented')
  end

  def handle_move(from_row, from_col, to_row, to_col)
    FanoronaLogger.log_info('')
    is_valid = @ref.is_move_valid(from_row, from_col, to_row, to_col)

    return :INVALID_MOVE unless is_valid

    player = @turn_operator.whose_turn
    player.make_move(from_row, from_col, to_row, to_col, @board)

    multiple_captures = @ref.check_multiple_captures(player)

    return :NO_CAPTURES unless multiple_captures

    :MORE_CAPTURES
  end

  def forfeit
    FanoronaLogger.log_error('Not Implemented')
  end

  def end_turn
    FanoronaLogger.log_error('Not Implemented')
  end

  def revert_move
    FanoronaLogger.log_error('Not Implemented')
  end
end
