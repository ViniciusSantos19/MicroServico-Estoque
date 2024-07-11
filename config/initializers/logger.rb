require 'logger'

Rails.logger = Logger.new($stdout)
Rails.logger.level = Logger::DEBUG
