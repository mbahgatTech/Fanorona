class Referee
  def initialize
    @board = Board.new
  end
 
  def is_move_valid(from_row, from_col, to_row, to_col)
    FanoronaLogger.log_error('Not Implemented')
    true
  end

  def check_multiple_captures(player)
    FanoronaLogger.log_error('Not Implemented')
    false
  end

  def check_game_over(turn)
    FanoronaLogger.log_info

    checkWhiteMoves = 0
    checkBlackMoves = 0

    if @board.how_many_colour(:WHITE) == 0
      return :BLACK
    elsif @board.how_many_colour(:BLACK) == 0
      return :WHITE
    end

    #for i in 0..8
    #  for j in 0..4
    #    if 
    #  end
    #end

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

  def check_move_type(from_row, from_col, to_row, to_col)
    FanoronaLogger.log_error('Not Implemented')
  end
end
