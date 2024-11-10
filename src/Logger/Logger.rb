require 'logger'
require 'singleton'

class FanoronaLogger
  include Singleton

  def initialize
    @logger = Logger.new(STDOUT)
  end

  def self.log_info(message)
    instance.logger.info(message)
  end

  def self.log_error(message)
    instance.logger.error(message)
  end

  attr_reader :logger
end
