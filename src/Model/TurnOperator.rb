class TurnOperator
  def initialize(player1, player2)
    @whose_turn = player1
  end

  def switch_turns(player1, player2)
    FanoronaLogger.log_info
    @whos_turn = @whos_turn == player1 ? player2 : player1
  end

  attr_reader :whose_turn
end
