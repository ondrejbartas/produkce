require 'test_helper'

class FinishedWorksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finished_works)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finished_work" do
    assert_difference('FinishedWork.count') do
      post :create, :finished_work => { }
    end

    assert_redirected_to finished_work_path(assigns(:finished_work))
  end

  test "should show finished_work" do
    get :show, :id => finished_works(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => finished_works(:one).id
    assert_response :success
  end

  test "should update finished_work" do
    put :update, :id => finished_works(:one).id, :finished_work => { }
    assert_redirected_to finished_work_path(assigns(:finished_work))
  end

  test "should destroy finished_work" do
    assert_difference('FinishedWork.count', -1) do
      delete :destroy, :id => finished_works(:one).id
    end

    assert_redirected_to finished_works_path
  end
end
