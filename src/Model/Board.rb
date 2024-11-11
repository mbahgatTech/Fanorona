class Board
  def initialize
    @board = nil
    @last_board = nil
  end

  def display_board
    FanoronaLogger.log_error('Not Implemented')
    [[]]
  end

  def get_last_board
    FanoronaLogger.log_error('Not Implemented')
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
    FanoronaLogger.log_error('Not Implemented')
    []
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

    rowArray = @board.at(row)
    space = rowArray.at(col)

    space == :E
  end

  def revert_move
    FanoronaLogger.log_error('Not Implemented')
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
    moves.select { |move| move[2] == opponent_colour }.map { |move| [move[0], move[1]] }
  end
end
