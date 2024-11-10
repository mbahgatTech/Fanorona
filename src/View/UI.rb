class UI
  def initialize
    @model = GameSystem.new
    @board_updater = BoardUpdater.new
  end

  def run_fanorona
    @model.start_game
  end

  def print_board
    FanoronaLogger.log_error('Not Implemented')
  end

  def print_rules
    FanoronaLogger.log_error('Not Implemented')
  end

  def process_move(from_row, from_col, to_row, to_col)
    FanoronaLogger.log_info("Parameters: from_row = #{from_row}, from_col = #{from_col}, to_row = #{to_row}, to_col = #{to_col}")
    FanoronaLogger.log_error('Not Implemented')
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
