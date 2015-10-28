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

  test 'on_error can be configured per each engine' do
    assert_raise do
      visit '/greeting'
    end
  end
end

class OnErrorGlobalTest < ActionDispatch::IntegrationTest
  setup do
    ControllerFallback::Engine.active_if { true }
    @on_error_was, Motorhead.config.on_error = Motorhead.config.on_error, ->(e) { raise e }
  end
  teardown do
    ControllerFallback::Engine.active_if { false }
    Motorhead.config.on_error = @on_error_was
  end

  test 'on_error can be configured globally' do
    assert_raise do
      visit '/greeting'
    end
  end
end
