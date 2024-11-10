class Referee
  def initialize
    @board = Board.new
  end

  def is_move_valid(from_row, from_col, to_row, to_col)
    FanoronaLogger.log_error('Not Implemented')
  end

  def check_multiple_captures(player)
    FanoronaLogger.log_error('Not Implemented')
  end

  def check_game_over
    FanoronaLogger.log_error('Not Implemented')
  end

  def end_turn_validate
    FanoronaLogger.log_error('Not Implemented')
  end

  def revert_move_validate
    FanoronaLogger.log_error('Not Implemented')
  end

  def check_move_type(from_row, from_col, to_row, to_col)
    FanoronaLogger.log_error('Not Implemented')
  end
end
