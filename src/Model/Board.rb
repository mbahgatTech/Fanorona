class Board
  def initialize
    setup_game_board
  end

  def display_board
    FanoronaLogger.log_info
    @board
  end

  def get_last_board
    FanoronaLogger.log_info
    @last_board
  end

  def move_piece(from_row, from_col, to_row, to_col, move_type)
    FanoronaLogger.log_error('Not Implemented')
  end

  def setup_game_board
    FanoronaLogger.log_info

    @board = [%i[B B B B B B B B B],
              %i[B B B B B B B B B],
              %i[B W B W E B W B W],
              %i[W W W W W W W W W],
              %i[W W W W W W W W W]]

    @last_board = @board
  end

  def how_many_colour(colour)
    FanoronaLogger.log_info

    count = 0

    @board.each do |row|
      row.each do |space|
        count += 1 if space == colour
      end
    end
  end

  def check_diagonals(row, col)
    FanoronaLogger.log_info

    row -= 1
    col -= 1

    odd_row = ((row % 2) == 0)

    if odd_row
      if (col % 2) == 0
        diagonals = []
        diagonals += [[row - 1, col - 1, @board[row - 1][col - 1]]] if (row > 0 && col > 0)
        diagonals += [[row + 1, col + 1, @board[row + 1][col + 1]]] if (row < (@board.length - 1) && col < (@board[0].length - 1))
        diagonals += [[row - 1, col + 1, @board[row - 1][col + 1]]] if (row > 0 && col < (@board[0].length - 1))
        diagonals += [[row - 1, col - 1, @board[row + 1][col - 1]]] if (row < (@board.length - 1) && col > 0)

        return diagonals
      else
        return nil
      end
    else
      if (col % 2) == 0
        return nil
      else
        diagonals = []
        diagonals += [row - 1, col - 1, @board[row - 1][col - 1]] if (row > 0 && col > 0)
        diagonals += [row + 1, col + 1, @board[row + 1][col + 1]] if (row < (@board.length - 1) && col < (@board[0].length - 1))
        diagonals += [row - 1, col + 1, @board[row - 1][col + 1]] if (row > 0 && col < (@board[0].length - 1))
        diagonals += [row - 1, col - 1, @board[row + 1][col - 1]] if (row < (@board.length - 1) && col > 0)
      
        return diagonals
      end
    end
  end

  def check_horizontals(row, col)
    FanoronaLogger.log_error('Not Implemented')
  end

  def check_verticals(row, col)
    FanoronaLogger.log_error('Not Implemented')
  end

  def check_empty_space(row, col)
    FanoronaLogger.log_info

    row -= 1
    col -= 1

    row_array = @board.at(row)
    space = row_array.at(col)

    space == :E
  end

  def revert_move
    FanoronaLogger.log_info
    @board = @last_board
  end

  def check_move_type(from_row, from_col, to_row, to_col, player)
    FanoronaLogger.log_error('Not Implemented')
  end
end
