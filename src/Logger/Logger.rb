require 'logger'
require 'singleton'

class FanoronaLogger
  include Singleton

  def initialize
    @logger = Logger.new(STDOUT)
    @logger.formatter = proc do |severity, datetime, progname, msg|
      "#{datetime.strftime('%Y-%m-%d %H:%M:%S')} [#{severity}] #{progname}: #{msg}\n"
    end
  end

  def self.log_info(message)
    log(:info, message)
  end

  def self.log_error(message)
    log(:error, message)
  end

  private_class_method def self.log(level, message)
    # Capture class and method names from the caller
    caller_info = caller(2..2).first
    class_and_method = caller_info[/`([^']*)'/, 1]
    klass = instance.class

    # Pass class and method names as progname
    instance.logger.public_send(level, "#{klass}##{class_and_method}: #{message}")
  end

  attr_reader :logger
end
