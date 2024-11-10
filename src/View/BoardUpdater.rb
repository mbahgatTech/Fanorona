class BoardUpdater
  def initialize
    @board = Board.new
  end

  def print_game_board(board)
    FanoronaLogger.log_info('')

    board.display_board.each do |row|
      puts row.join(' ')
    end
  end
end
