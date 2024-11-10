class GameSystem
  def initialize
    @board = Board.new
    @ref = Referee.new
  end

  def start_game(colour1, colour2)
    FanoronaLogger.log_info
    @player1 = Player.new(colour1, true)
    @player2 = Player.new(colour2, false)
    @turn_operator = TurnOperator.new(@player1, @player2)
  end

  def end_game
    FanoronaLogger.log_error('Not Implemented')
  end

  def handle_move(from_row, from_col, to_row, to_col)
    FanoronaLogger.log_error('Not Implemented')
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

  def whose_turn
    FanoronaLogger.log_info
    @turn_operator.whose_turn
  end
end
