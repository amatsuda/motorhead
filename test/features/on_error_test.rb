require 'test_helper'

class OnErrorTest < ActionDispatch::IntegrationTest
  setup do
    ControllerFallback::Engine.active_if { true }
    @on_error_was, ControllerFallback::Engine.on_error = ControllerFallback::Engine.on_error, ->(e) { raise e }
  end
  teardown do
    ControllerFallback::Engine.active_if { false }
    ControllerFallback::Engine.on_error = @on_error_was
  end

  test 'on_error can be configured per each extension' do
    assert_raise do
      visit '/greeting'
    end
  end
end

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
