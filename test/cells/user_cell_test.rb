require 'test_helper'

class UserCellTest < Cell::TestCase
  test "register" do
    invoke :register
    assert_select "p"
  end
  
  test "login" do
    invoke :login
    assert_select "p"
  end
  
  test "logged" do
    invoke :logged
    assert_select "p"
  end
  

end
