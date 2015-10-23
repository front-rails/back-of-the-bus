require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get create" do
    post :create, user: {name: "Test",
        email: "test@example.com",
        password: "password"},
        format: :json
    assert_response :success
  end

  test "should get update" do
    patch :update, id: users(:one).id,
        user: {name: "Test2",
        email: "test@example.com"},
        format: :json
    assert_response :success
  end

  test "should get show" do
    get :show, id: users(:one).id, format: :json
    assert_response :success
  end

  test "should get destroy" do
    delete :destroy, id: users(:one), format: :json
    assert_response :success
  end

end
