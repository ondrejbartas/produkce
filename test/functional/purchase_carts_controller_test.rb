require 'test_helper'

class PurchaseCartsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_carts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_cart" do
    assert_difference('PurchaseCart.count') do
      post :create, :purchase_cart => { }
    end

    assert_redirected_to purchase_cart_path(assigns(:purchase_cart))
  end

  test "should show purchase_cart" do
    get :show, :id => purchase_carts(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => purchase_carts(:one).id
    assert_response :success
  end

  test "should update purchase_cart" do
    put :update, :id => purchase_carts(:one).id, :purchase_cart => { }
    assert_redirected_to purchase_cart_path(assigns(:purchase_cart))
  end

  test "should destroy purchase_cart" do
    assert_difference('PurchaseCart.count', -1) do
      delete :destroy, :id => purchase_carts(:one).id
    end

    assert_redirected_to purchase_carts_path
  end
end
