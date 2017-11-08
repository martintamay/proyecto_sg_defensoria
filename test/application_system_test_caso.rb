require "test_helper"

class ApplicationSystemTestCaso < ActionDispatch::SystemTestCaso
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
