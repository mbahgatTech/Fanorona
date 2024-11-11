class BoardUpdater
  def initialize
    @board = Board.new
  end

  def print_game_board(board)
    FanoronaLogger.log_info

    puts '  1 2 3 4 5 6 7 8 9'

    @board.display_board.each_with_index do |row, index|
      print "#{index + 1} "
      # puts row[0].inspect
      # puts row
      puts row.map { |s| s == :E ? '.' : s }.join(' ')
    end
  end
end
