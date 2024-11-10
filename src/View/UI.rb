class UI
  def initialize
    @board = Board.new
    @model = GameSystem.new(@board, self)
    @board_updater = BoardUpdater.new
  end

  def run_fanorona
    FanoronaLogger.log_error('Not Implemented')
  end

  def print_board
    FanoronaLogger.log_error('Not Implemented')
  end

  def print_rules
    FanoronaLogger.log_error('Not Implemented')
  end

  def process_move(from_row, from_col, to_row, to_col)
    FanoronaLogger.log_info('')
    status = @model.handle_move(from_row, from_col, to_row, to_col)

    return false if status == :INVALID_MOVE

    @board_updater.print_game_board(@board)

    if status == :NO_CAPTURES
      puts 'No More Captures'
    elsif status == :MORE_CAPTURES
      puts 'More Captures Available'
    end

    true
  end

  def revert_move
    FanoronaLogger.log_error('Not Implemented')
  end

  def forfeit
    FanoronaLogger.log_error('Not Implemented')
  end

  def end_turn
    FanoronaLogger.log_error('Not Implemented')
  end

  def pause_game
    FanoronaLogger.log_error('Not Implemented')
  end

  def print_current_turn
    FanoronaLogger.log_error('Not Implemented')
  end

  def pick_capture_type
    FanoronaLogger.log_error('Not Implemented')
  end
end
