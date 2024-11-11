require 'logger'
require 'singleton'

class FanoronaLogger
  include Singleton

  def initialize
    @logger = Logger.new('./logs/.log')
    @logger.formatter = proc do |severity, datetime, progname, msg|
      "#{datetime.strftime('%Y-%m-%d %H:%M:%S')} [#{severity}] #{progname}: #{msg}\n"
    end
  end

  def self.log_info(message = '')
    log(:info, message)
  end

  def self.log_error(message = '')
    log(:error, message)
  end

  private_class_method def self.log(level, message)
    # Capture class and method names from the caller
    # Use caller to get the location of the logging call
    caller_info = caller_locations(2, 1).first
    # Get the calling class and method name
    # Get the calling method
    calling_method = caller_info.label

    # Use ObjectSpace to resolve the class name of the caller
    calling_class = ObjectSpace.each_object(Class).find do |cls|
      cls.instance_methods(false).include?(calling_method.to_sym)
    end

    # Pass class and method names as progname
    instance.logger.public_send(level, "#{calling_class}.#{calling_method}: #{message}")
  end

  attr_reader :logger
end
