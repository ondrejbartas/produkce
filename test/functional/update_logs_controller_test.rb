require 'test_helper'

class UpdateLogsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:update_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create update_log" do
    assert_difference('UpdateLog.count') do
      post :create, :update_log => { }
    end

    assert_redirected_to update_log_path(assigns(:update_log))
  end

  test "should show update_log" do
    get :show, :id => update_logs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => update_logs(:one).to_param
    assert_response :success
  end

  test "should update update_log" do
    put :update, :id => update_logs(:one).to_param, :update_log => { }
    assert_redirected_to update_log_path(assigns(:update_log))
  end

  test "should destroy update_log" do
    assert_difference('UpdateLog.count', -1) do
      delete :destroy, :id => update_logs(:one).to_param
    end

    assert_redirected_to update_logs_path
  end
end
