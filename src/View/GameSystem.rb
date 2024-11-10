class GameSystem
  def initialize
    @board = Board.new
    @player1 = Player.new
    @player2 = Player.new
    @ref = Referee.new
    @turn_operator = TurnOperator.new
    # @ui = UI.new - This does an infinite loop cuz nested initilizations
  end

  def start_game(colour1, colour2)
    FanoronaLogger.log_error('Not Implemented')
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
end
