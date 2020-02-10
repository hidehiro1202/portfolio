require 'test_helper'

class ProfilsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get profils_new_url
    assert_response :success
  end

end
