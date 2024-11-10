class Player
  def initialize(colour, turn)
    @colour = colour
    @turn = turn
    @pieces_captured = nil
    @moves_made_on_turn = 0
  end

  def check_colour
    FanoronaLogger.log_info
    @colour
  end

  def make_move(from_row, from_col, to_row, to_col, board)
    FanoronaLogger.log_info
    board.move_piece(from_row, from_col, to_row, to_col)
  end

  def capture_piece
    FanoronaLogger.log_error('Not Implemented')
  end

  def revert_move
    FanoronaLogger.log_error('Not Implemented')
  end

  def end_turn
    FanoronaLogger.log_info
    @moves_made_on_turn = 0
  end

  def flip_turn
    FanoronaLogger.log_info
    @turn = !@turn
  end

  def check_moves_made
    FanoronaLogger.log_info
    @moves_made_on_turn
  end
end
