require 'test_helper'

class TapeSellsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tape_sells)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tape_sell" do
    assert_difference('TapeSell.count') do
      post :create, :tape_sell => { }
    end

    assert_redirected_to tape_sell_path(assigns(:tape_sell))
  end

  test "should show tape_sell" do
    get :show, :id => tape_sells(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tape_sells(:one).to_param
    assert_response :success
  end

  test "should update tape_sell" do
    put :update, :id => tape_sells(:one).to_param, :tape_sell => { }
    assert_redirected_to tape_sell_path(assigns(:tape_sell))
  end

  test "should destroy tape_sell" do
    assert_difference('TapeSell.count', -1) do
      delete :destroy, :id => tape_sells(:one).to_param
    end

    assert_redirected_to tape_sells_path
  end
end
