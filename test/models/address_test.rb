require "test_helper"

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

    test "should not save an address without name" do
      address = Address.new
      assert_not address.save
    end
end
