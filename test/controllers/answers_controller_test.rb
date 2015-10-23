require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should get show" do
    get :show, id: answers(:one).id, format: :json
    assert_response :success
  end

end
