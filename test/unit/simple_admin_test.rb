require File.dirname(__FILE__) + '/test_helper'

class SimpleAdminTest < Test::Unit::TestCase

  def test_state_conditional
    SimpleAdmin.find('markpercival.us')
  end
end