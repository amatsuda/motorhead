require 'test_helper'

class OnErrorGlobalTest < ActionDispatch::IntegrationTest
  setup do
    ControllerFallback::Engine.active_if { true }
    @on_error_was, Wanko.config.on_error = Wanko.config.on_error, ->(e) { raise e }
  end
  teardown do
    ControllerFallback::Engine.active_if { false }
    Wanko.config.on_error = @on_error_was
  end

  test 'on_error can be configured globally' do
    assert_raise do
      visit '/greeting'
    end
  end
end
