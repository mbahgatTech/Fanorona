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
    @last_board = @board.map(&:clone)
    colour = @board[from_row - 1][from_col - 1]
    opponent_colour = colour == :W ? :B : :W

    @board[to_row - 1][to_col - 1] = colour
    @board[from_row - 1][from_col - 1] = :E

    return if move_type.nil? || move_type.empty?

    if from_row != to_row && from_col != to_col
      if from_row > to_row && from_col < to_col
        row = move_type[0]
        col = move_type[1] - 2

        while (row -= 1) >= 0 && (col += 1) < @board[0].length && @board[row][col] == opponent_colour
          @board[row][col] = :E
        end
      elsif from_row < to_row && from_col > to_col
        row = move_type[0] - 2
        col = move_type[1]

        while (row += 1) < @board.length && (col -= 1) >= 0 && @board[row][col] == opponent_colour
          @board[row][col] = :E
        end
      elsif from_row < to_row && from_col < to_col
        row = move_type[0] - 2
        col = move_type[1] - 2

        while (row += 1) < @board.length && (col += 1) < @board[0].length && @board[row][col] == opponent_colour
          @board[row][col] = :E
        end
      elsif from_row > to_row && from_col > to_col
        row = move_type[0]
        col = move_type[1]

        while (row -= 1) >= 0 && (col -= 1) >= 0 && @board[row][col] == opponent_colour
          @board[row][col] = :E
        end
      end
    elsif from_row != to_row
      row = move_type[0] - 2
      col = move_type[1] - 1

      while (row += 1) < @board.length && @board[row][col] == opponent_colour
        @board[row][col] = :E
      end

      row = move_type[0] - 1

      while (row -= 1) >= 0 && @board[row][col] == opponent_colour
        @board[row][col] = :E
      end
    elsif from_col != to_col
      row = move_type[0] - 1
      col = move_type[1] - 2

      while (col += 1) < @board[0].length && @board[row][col] == opponent_colour
        @board[row][col] = :E
      end

      col = move_type[1] - 1

      while (col -= 1) >= 0 && @board[row][col] == opponent_colour
        @board[row][col] = :E
      end
    end
  end

  def setup_game_board
    FanoronaLogger.log_info

    # @board = [%i[B B B B B B B B B],
    #           %i[B B B B B B B B B],
    #           %i[B W B W E B W B W],
    #           %i[W W W W W W W W W],
    #           %i[W W W W W W W W W]]

    @board = [%i[E E E E E E E E E],
              %i[E E W E E B E E E],
              %i[E E E E E E E E E],
              %i[E E E E E E E E E],
              %i[E E E E E E E E E]]

    @last_board = @board.map(&:clone)
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
    verticals += [[row, col - 1, @board[row][col - 1]]] if col.positive?
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
    @board = @last_board.map(&:clone)
  end

  def check_move_type(from_row, from_col, to_row, to_col, player)
    FanoronaLogger.log_info
    moves = []

    if from_row != to_row && from_col != to_col
      from_row -= 1
      from_col -= 1
      to_row -= 1
      to_col -= 1

      if from_row > to_row && from_col < to_col
        moves += [[to_row - 1, to_col + 1, @board[to_row - 1][to_col + 1]]]
        moves += [[from_row + 1, from_col - 1, @board[from_row + 1][from_col - 1]]]
      elsif from_row < to_row && from_col > to_col
        moves += [[to_row + 1, to_col - 1, @board[to_row + 1][to_col - 1]]]
        moves += [[from_row - 1, from_col + 1, @board[from_row - 1][from_col + 1]]]
      elsif from_row < to_row && from_col < to_col
        moves += [[to_row + 1, to_col + 1, @board[to_row + 1][to_col + 1]]]
        moves += [[from_row - 1, from_col - 1, @board[from_row - 1][from_col - 1]]]
      elsif from_row > to_row && from_col > to_col
        moves += [[to_row - 1, to_col - 1, @board[to_row - 1][to_col - 1]]]
        moves += [[from_row + 1, from_col + 1, @board[from_row + 1][from_col + 1]]]
      end
    elsif from_row != to_row
      moves += check_horizontals(from_row, from_col)
      moves += check_horizontals(to_row, to_col)
    elsif from_col != to_col
      moves += check_verticals(from_row, from_col)
      puts(moves)
      moves += check_verticals(to_row, to_col)
    end

    opponent_colour = player.check_colour == :W ? :B : :W
    moves.select { |move| move[2] == opponent_colour }.map { |move| [move[0] + 1, move[1] + 1] }
  end
end
