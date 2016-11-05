# frozen_string_literal: true
module Motorhead
  include ActiveSupport::Configurable

  configure do |config|
    config.on_error = ->(err) do
      if ['development', 'test'].include? Rails.env
        raise err
      else
        p err
      end
    end
  end
end
