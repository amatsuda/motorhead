require 'test_helper'

class MountAtTest < ActionDispatch::IntegrationTest
  setup do
    MountAtCapricorn::Engine.active_if { true }
  end
  teardown do
    MountAtCapricorn::Engine.active_if { false }
  end

  test 'the Engine should be mounted at the configured mount_at path' do
    visit '/capricorn/top'
    assert has_content? 'My life, my heart, black night, my star'
  end
end
