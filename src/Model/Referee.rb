class Referee
  def initialize(board)
    @board = board
  end

  def is_move_valid(from_row, from_col, to_row, to_col)
    FanoronaLogger.log_info

    from_row -= 1
    from_col -= 1
    to_row -= 1
    to_col -= 1

    is_diagonal = from_col != to_col && from_row != to_row

    return false if is_diagonal && @board.check_diagonals(from_row, from_col).empty?

    # moving more than 1 slot
    return false if (from_row - to_row).abs > 1 || (from_col - to_col).abs > 1

    board = @board.display_board
    moving_player = board[from_row][from_col]

    # moving an empty slot
    return false if moving_player == :E

    target = board[to_row][to_col]

    # moving to a non-empty slot
    return false unless target == :E

    true
  end

  def check_multiple_captures(player)
    FanoronaLogger.log_error('Infeasable')
    false
  end

  def check_game_over
    FanoronaLogger.log_info

    checkWhiteMoves = 0
    checkBlackMoves = 0

    if @board.how_many_colour(:W).zero?
      return :B
    elsif @board.how_many_colour(:B).zero?
      return :W
    end

    nil
  end

  def end_turn_validate(player)
    FanoronaLogger.log_info
    return true if player.check_moves_made.positive?

    false
  end

  def revert_move_validate(player)
    FanoronaLogger.log_info
    return true if player.check_moves_made.positive?

    false
  end

  def check_move_type(from_row, from_col, to_row, to_col, player)
    @board.check_move_type(from_row, from_col, to_row, to_col, player)
  end
end
