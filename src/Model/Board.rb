class Board
  def initialize
    @board = nil
    @last_board = nil
  end

  def display_board
    FanoronaLogger.log_error('Not Implemented')
  end

  def get_last_board
    FanoronaLogger.log_error('Not Implemented')
  end

  def move_piece(from_row, from_col, to_row, to_col)
    FanoronaLogger.log_error('Not Implemented')
  end

  def setup_game_board
    FanoronaLogger.log_error('Not Implemented')
  end

  def how_many_colour(colour)
    FanoronaLogger.log_error('Not Implemented')
  end

  def check_diagonals(row, col)
    FanoronaLogger.log_error('Not Implemented')
  end

  def check_horizontals(row, col)
    FanoronaLogger.log_error('Not Implemented')
  end

  def check_verticals(row, col)
    FanoronaLogger.log_error('Not Implemented')
  end

  def check_empty_space(row, col)
    FanoronaLogger.log_error('Not Implemented')
  end

  def revert_move
    FanoronaLogger.log_error('Not Implemented')
  end

  def check_move_type(from_row, from_col, to_row, to_col)
    FanoronaLogger.log_error('Not Implemented')
  end
end
