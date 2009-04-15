require 'test_helper'

class WarehouseControlsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:warehouse_controls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create warehouse_control" do
    assert_difference('WarehouseControl.count') do
      post :create, :warehouse_control => { }
    end

    assert_redirected_to warehouse_control_path(assigns(:warehouse_control))
  end

  test "should show warehouse_control" do
    get :show, :id => warehouse_controls(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => warehouse_controls(:one).id
    assert_response :success
  end

  test "should update warehouse_control" do
    put :update, :id => warehouse_controls(:one).id, :warehouse_control => { }
    assert_redirected_to warehouse_control_path(assigns(:warehouse_control))
  end

  test "should destroy warehouse_control" do
    assert_difference('WarehouseControl.count', -1) do
      delete :destroy, :id => warehouse_controls(:one).id
    end

    assert_redirected_to warehouse_controls_path
  end
end
