require 'test_helper'

class Backoffice::CidsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_cids_index_url
    assert_response :success
  end

end
