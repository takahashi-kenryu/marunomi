require 'test_helper'

class Marunomi::Test < ActiveSupport::TestCase
  test "truth" do
    # assert_kind_of Module, Marunomi
    assert User.respond_to? :import
  end
end
