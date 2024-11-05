class TurnOperator
  def initialize
    @whose_turn = nil
  end

  def switch_turns(player1, player2)
    FanoronaLogger.log_error('Not Implemented')
  end

  attr_reader :whose_turn
end
