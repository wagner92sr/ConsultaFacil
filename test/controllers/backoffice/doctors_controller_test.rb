require 'test_helper'

class Backoffice::DoctorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_doctors_index_url
    assert_response :success
  end

end
