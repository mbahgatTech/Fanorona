class TurnOperator
  def initialize(player1, player2)
    @whose_turn = player1
  end

  def switch_turns(player1, player2)
    FanoronaLogger.log_info
    @whose_turn = @whose_turn == player1 ? player2 : player1
    player1.flip_turn
    player2.flip_turn
  end

  attr_reader :whose_turn
end
