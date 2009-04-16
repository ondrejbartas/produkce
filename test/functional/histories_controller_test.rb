require 'test_helper'

class HistoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create history" do
    assert_difference('History.count') do
      post :create, :history => { }
    end

    assert_redirected_to history_path(assigns(:history))
  end

  test "should show history" do
    get :show, :id => histories(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => histories(:one).id
    assert_response :success
  end

  test "should update history" do
    put :update, :id => histories(:one).id, :history => { }
    assert_redirected_to history_path(assigns(:history))
  end

  test "should destroy history" do
    assert_difference('History.count', -1) do
      delete :destroy, :id => histories(:one).id
    end

    assert_redirected_to histories_path
  end
end
