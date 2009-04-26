require 'test_helper'

class SystemCommentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:system_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create system_comment" do
    assert_difference('SystemComment.count') do
      post :create, :system_comment => { }
    end

    assert_redirected_to system_comment_path(assigns(:system_comment))
  end

  test "should show system_comment" do
    get :show, :id => system_comments(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => system_comments(:one).to_param
    assert_response :success
  end

  test "should update system_comment" do
    put :update, :id => system_comments(:one).to_param, :system_comment => { }
    assert_redirected_to system_comment_path(assigns(:system_comment))
  end

  test "should destroy system_comment" do
    assert_difference('SystemComment.count', -1) do
      delete :destroy, :id => system_comments(:one).to_param
    end

    assert_redirected_to system_comments_path
  end
end
