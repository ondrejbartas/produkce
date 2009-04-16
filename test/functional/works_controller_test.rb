require 'test_helper'

class WorksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:works)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work" do
    assert_difference('Work.count') do
      post :create, :work => { }
    end

    assert_redirected_to work_path(assigns(:work))
  end

  test "should show work" do
    get :show, :id => works(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => works(:one).id
    assert_response :success
  end

  test "should update work" do
    put :update, :id => works(:one).id, :work => { }
    assert_redirected_to work_path(assigns(:work))
  end

  test "should destroy work" do
    assert_difference('Work.count', -1) do
      delete :destroy, :id => works(:one).id
    end

    assert_redirected_to works_path
  end
end
