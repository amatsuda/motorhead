require 'test_helper'

class ViewRenderingTest < ActionDispatch::IntegrationTest
  setup do
    $view_extension_rendered = false
  end

  test 'views in inactive extensions are never be rendered' do
    visit '/greeting'
    refute $view_extension_rendered
  end
end
