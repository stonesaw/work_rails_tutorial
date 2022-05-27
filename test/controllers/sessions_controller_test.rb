require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest  
  test "should get new" do
    logout
    get "/login"
    assert_response :success
  end
  
  test "should login" do
    logout
    dave = users(:one)
    post "/login", params: { name: dave.name, password: "secret" }
    assert_redirected_to admin_url
    assert_equal dave.id, session[:user_id]
  end
  
  test "should fail login" do
    logout
    dave = users(:one)
    post "/login", params: { name: dave.name, password: "wrong" }
    assert_redirected_to login_url
  end
  
  test "should logout" do
    delete "/logout"
    assert_redirected_to store_url
  end
end
