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
    FanoronaLogger.log_info

    @board[to_row - 1][to_col - 1] = @board[from_row - 1][from_col - 1]
    @board[from_row - 1][from_col - 1] = :E
    @board[move_type[0] - 1][move_type[1] - 1] = :E
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

    count
  end

  def check_diagonals(row, col)
    FanoronaLogger.log_info

    row -= 1
    col -= 1

    odd_row = row.even?

    if odd_row
      if col.even?
        diagonals = []
        diagonals += [[row - 1, col - 1, @board[row - 1][col - 1]]] if row > 0 && col > 0
        if row < (@board.length - 1) && col < (@board[0].length - 1)
          diagonals += [[row + 1, col + 1,
                         @board[row + 1][col + 1]]]
        end
        diagonals += [[row - 1, col + 1, @board[row - 1][col + 1]]] if row > 0 && col < (@board[0].length - 1)
        diagonals += [[row + 1, col - 1, @board[row + 1][col - 1]]] if row < (@board.length - 1) && col > 0

        diagonals
      else
        []
      end
    elsif col.even?
      []
    else
      diagonals = []
      diagonals += [[row - 1, col - 1, @board[row - 1][col - 1]]] if row > 0 && col > 0
      if row < (@board.length - 1) && col < (@board[0].length - 1)
        diagonals += [[row + 1, col + 1,
                       @board[row + 1][col + 1]]]
      end
      diagonals += [[row - 1, col + 1, @board[row - 1][col + 1]]] if row > 0 && col < (@board[0].length - 1)
      diagonals += [[row + 1, col - 1, @board[row + 1][col - 1]]] if row < (@board.length - 1) && col > 0

      diagonals
    end
  end

  def check_horizontals(row, col)
    FanoronaLogger.log_info
    row -= 1
    col -= 1

    horizontals = []
    horizontals += [[row - 1, col, @board[row - 1][col]]] if row > 0
    horizontals += [[row + 1, col, @board[row + 1][col]]] if row < (@board.length - 1)

    horizontals
  end

  def check_verticals(row, col)
    FanoronaLogger.log_info
    row -= 1
    col -= 1

    verticals = []
    verticals += [[row, col - 1, @board[row][col - 1]]] if col > 0
    verticals += [[row, col + 1, @board[row][col + 1]]] if col < (@board[0].length - 1)

    verticals
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
    FanoronaLogger.log_info
    moves = []

    moves += check_horizontals(from_row, from_col)
    moves += check_verticals(from_row, from_col)
    moves += check_diagonals(from_row, from_col)

    moves += check_horizontals(to_row, to_col)
    moves += check_verticals(to_row, to_col)
    moves += check_diagonals(to_row, to_col)

    opponent_colour = player.check_colour == :W ? :B : :W
    moves.select { |move| move[2] == opponent_colour }.map { |move| [move[0] + 1, move[1] + 1] }
  end
end
