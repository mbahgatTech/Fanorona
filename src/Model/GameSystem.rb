class GameSystem
  def initialize(board, ui)
    @board = board
    @ui = ui
    @ref = Referee.new(board)
  end

  def start_game(colour1, colour2)
    FanoronaLogger.log_info
    @player1 = Player.new(colour1, true)
    @player2 = Player.new(colour2, false)
    @turn_operator = TurnOperator.new(@player1, @player2)
    @board.setup_game_board
  end

  def end_game(winner)
    FanoronaLogger.log_info
    colour = winner == :W ? 'White' : 'Black'
    puts
    puts "#{colour} Player is the Winner!!"
    puts
    @ui.run_fanorona
  end

  def handle_move(from_row, from_col, to_row, to_col)
    FanoronaLogger.log_info
    is_valid = @ref.is_move_valid(from_row, from_col, to_row, to_col)

    return :INVALID_MOVE unless is_valid

    player = @turn_operator.whose_turn

    available_captures = @ref.check_move_type(from_row, from_col, to_row, to_col, player)
    capture_type = @ui.pick_capture_type(available_captures)

    player.make_move(from_row, from_col, to_row, to_col, capture_type, @board)
    multiple_captures = @ref.check_multiple_captures(player)

    return :NO_CAPTURES unless multiple_captures

    :MORE_CAPTURES
  end

  def forfeit
    FanoronaLogger.log_info
    end_game(@turn_operator.whose_turn.check_colour)
  end

  def end_turn
    FanoronaLogger.log_info
    @turn_operator.switch_turns(@player1, @player2) if @ref.end_turn_validate(whose_turn)

    winner = @ref.check_game_over

    return if winner.nil?

    end_game(winner)
  end

  def revert_move
    FanoronaLogger.log_info
    player = @turn_operator.whose_turn
    return unless @ref.revert_move_validate(player)

    player.revert_move(@board)
    @board.revert_move
  end

  def whose_turn
    FanoronaLogger.log_info
    @turn_operator.whose_turn
  end
end
