require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "create a simple user" do
    assert_difference 'User.all.count', 1 do
      User.create name: 'user 01'
    end
  end


  test "don't create a user without name" do 
    assert_difference 'User.all.count', 0 do
      User.create bio: 'anything'
    end
  end

  test "don't create duplicated user" do
    assert_difference 'User.all.count', 1 do
      User.create name: 'user 01'
      User.create name: 'user 01'
    end
  end

  test "don't create user unless born" do
    assert_difference 'User.all.count', 0 do
      User.create name: 'User 001', age: -1
    end
  end

end