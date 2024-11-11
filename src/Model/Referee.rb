class Referee
  def initialize(board)
    @board = board
  end
 
  def is_move_valid(from_row, from_col, to_row, to_col)
    FanoronaLogger.log_error('Not Implemented')
    true
  end

  def check_multiple_captures(player)
    FanoronaLogger.log_error('Not Implemented')
    false
  end

  def check_game_over
    FanoronaLogger.log_info

    checkWhiteMoves = 0
    checkBlackMoves = 0

    if @board.how_many_colour(:W) == 0
      return :B
    elsif @board.how_many_colour(:B) == 0
      return :W
    end

    return nil
  end

  def end_turn_validate(player)
    FanoronaLogger.log_info
    return true if player.check_moves_made.positive?

    false
  end

  def revert_move_validate
    FanoronaLogger.log_error('Not Implemented')
  end

  def check_move_type(from_row, from_col, to_row, to_col, player)
    @board.check_move_type(from_row, from_col, to_row, to_col, player)
  end
end
