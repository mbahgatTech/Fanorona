class Player
  def initialize
    colour = nil
    turn = nil
    pieces_captured = nil
    moves_made_on_turn = nil
  end

  def checkColour
    FanoronaLogger.log_error('Not Implemented')
  end

  def make_move(from_row, from_col, to_row, to_col, board)
    FanoronaLogger.log_error('Not Implemented')
  end

  def capture_piece
    FanoronaLogger.log_error('Not Implemented')
  end

  def revert_move
    FanoronaLogger.log_error('Not Implemented')
  end

  def end_turn
    FanoronaLogger.log_error('Not Implemented')
  end

  def flip_turn
    FanoronaLogger.log_error('Not Implemented')
  end

  def check_moves_made
    FanoronaLogger.log_error('Not Implemented')
  end
end
