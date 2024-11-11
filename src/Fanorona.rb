require_relative './load_dependencies'

ui = UI.new
ui.run_fanorona

ui.print_board
loop do
  ui.print_current_turn
  puts 'Select a piece to move (Row, Column):'
  puts
  print '> '
  input = gets.chomp
  from_row, from_col = input.split(',').map(&:strip).map(&:to_i)
  puts

  # get to coordinates
  puts 'Where do you want to move the piece:'
  puts
  print '> '
  input = gets.chomp
  to_row, to_col = input.split(',').map(&:strip).map(&:to_i)
  puts

  status = ui.process_move(from_row, from_col, to_row, to_col)
  puts 'Invalid move! Try again' if status == :INVALID_MOVE
  ui.print_board
  next if status == :INVALID_MOVE

  puts
  puts '> Move performed!'
  puts
  puts 'Here is the updated board'
  puts
  ui.print_board
  puts
  puts 'Undo move? (Y or N)'
  puts
  print('> ')
  input = gets.chomp
  case input.downcase
  when 'y'
    ui.revert_move
    ui.print_board
    next
  end
  if status == :MORE_CAPTURES
    puts 'You can make another capture! Go again!' if status == :MORE_CAPTURES
    puts
    ui.print_board
    next
  end

  ui.end_turn
end
