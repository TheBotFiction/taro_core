# frozen_string_literal: true

class Safety
  class << self
    def call(&block)
      begin
        block.call
      rescue => e
        Rails.logger.debug(e.message)
        Rails.logger.debug(e.backtrace)
      end
    end
  end
end
