require 'test_helper'

class GreetingTest < ActionDispatch::IntegrationTest
  test 'The controller works without extensions' do
    visit '/greeting'
    assert has_content? 'hello'
  end
end
