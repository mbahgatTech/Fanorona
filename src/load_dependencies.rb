current_file = File.expand_path(__FILE__)

# Require all Ruby files in the current directory and subdirectories, except the current file
Dir.glob(File.join(__dir__, '*/*.rb')).each do |file|
  require file unless File.expand_path(file) == current_file
end
