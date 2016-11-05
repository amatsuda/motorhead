# frozen_string_literal: true
require 'test_helper'

class GreetingTest < ActionDispatch::IntegrationTest
  test 'The controller works without engines' do
    visit '/greeting'
    assert has_content? 'hello, world'
  end
end
