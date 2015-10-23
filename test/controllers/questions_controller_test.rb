require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should get show" do
    get :show, id: questions(:one).id, format: :json
    assert_response :success
  end

end
