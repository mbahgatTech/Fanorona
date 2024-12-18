class TurnOperator
  def initialize(player1, player2)
    @whose_turn = player1.check_colour == :W ? player1 : player2
  end

  def switch_turns(player1, player2)
    FanoronaLogger.log_info
    @whose_turn = @whose_turn == player1 ? player2 : player1
    player1.flip_turn
    player2.flip_turn

    player1.end_turn
    player2.end_turn
  end

  attr_reader :whose_turn
end
