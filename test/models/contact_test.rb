require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test "don't create a contact without name" do
    assert_difference 'User.all.count', 0 do
      User.first.contacts.create born_date:'anything'
    end
  end
end
