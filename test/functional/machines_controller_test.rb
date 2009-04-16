require 'test_helper'

class MachinesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:machines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create machine" do
    assert_difference('Machine.count') do
      post :create, :machine => { }
    end

    assert_redirected_to machine_path(assigns(:machine))
  end

  test "should show machine" do
    get :show, :id => machines(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => machines(:one).id
    assert_response :success
  end

  test "should update machine" do
    put :update, :id => machines(:one).id, :machine => { }
    assert_redirected_to machine_path(assigns(:machine))
  end

  test "should destroy machine" do
    assert_difference('Machine.count', -1) do
      delete :destroy, :id => machines(:one).id
    end

    assert_redirected_to machines_path
  end
end
