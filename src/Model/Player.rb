class Player
  def initialize(colour, turn)
    @colour = colour
    @turn = turn
    @pieces_captured = 0
    @moves_made_on_turn = 0
  end

  def check_colour
    FanoronaLogger.log_info
    @colour
  end

  def make_move(from_row, from_col, to_row, to_col, move_type, board)
    FanoronaLogger.log_info
    opp_colour = @colour == :W ? :B : :W
    prev_opponent = board.how_many_colour(opp_colour)
    board.move_piece(from_row, from_col, to_row, to_col, move_type)
    @moves_made_on_turn += 1
    after_opponent = board.how_many_colour(opp_colour)

    @pieces_captured += prev_opponent - after_opponent
  end

  def capture_piece
    FanoronaLogger.log_info
    @pieces_captured += 1
  end

  def revert_move(board)
    FanoronaLogger.log_info
    last_board = board.get_last_board

    prev_opp_count = 0
    opp_colour = @colour == :W ? :B : :W
    last_board.each do |row|
      row.each do |space|
        prev_opp_count += 1 if space == opp_colour
      end
    end

    curr_opp_count = board.how_many_colour(opp_colour)

    @pieces_captured -= prev_opp_count - curr_opp_count
    @moves_made_on_turn -= 1
  end

  def end_turn
    FanoronaLogger.log_info
    @moves_made_on_turn = 0
  end

  def flip_turn
    FanoronaLogger.log_info
    @turn = !@turn
  end

  def check_moves_made
    FanoronaLogger.log_info
    @moves_made_on_turn
  end
end
