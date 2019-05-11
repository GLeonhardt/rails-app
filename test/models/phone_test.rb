require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  test "create a simple phone" do
    assert_difference 'Phone.all.count', 1 do
      Phone.create number: '12345678', contact: Contact.first
    end
  end

  test "don't create a phone with empity phone" do 
    assert_difference 'Phone.all.count', 1 do
      Phone.create segment_phone:"aaaaaaaa", contact: Contact.first
    end
  end

  test "don't create a duplicate phone for same contact" do
  assert_difference 'Phone.all.count', 1 do
      Phone.create number: '12345678', contact: Contact.first
      Phone.create number: '12345678', contact: Contact.first
    end
  end

  test "only one phone can be default" do
    Phone.create! number: '1324821678', default_phone: true, contact: Contact.first
    Phone.create! number: '4512', default_phone:true, contact: Contact.first
    assert_equal Phone.where(default_phone: true).count, 1
  end
end
