require "test_helper"

class CakeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

    test "should not save a cake without name" do
      cake = Cake.new
      assert_not cake.save
    end
end
