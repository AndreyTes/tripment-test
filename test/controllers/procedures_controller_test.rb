require 'test_helper'

class ProceduresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get procedures_index_url
    assert_response :success
  end

end
