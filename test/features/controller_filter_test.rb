require 'test_helper'

class ControllerFilterTest < ActionDispatch::IntegrationTest
  test 'Filters are properly executed' do
    visit '/greeting'
    assert has_content? 'world'
  end
end
