require 'test_helper'

class ReceptionCategoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reception_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reception_category" do
    assert_difference('ReceptionCategory.count') do
      post :create, :reception_category => { }
    end

    assert_redirected_to reception_category_path(assigns(:reception_category))
  end

  test "should show reception_category" do
    get :show, :id => reception_categories(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => reception_categories(:one).to_param
    assert_response :success
  end

  test "should update reception_category" do
    put :update, :id => reception_categories(:one).to_param, :reception_category => { }
    assert_redirected_to reception_category_path(assigns(:reception_category))
  end

  test "should destroy reception_category" do
    assert_difference('ReceptionCategory.count', -1) do
      delete :destroy, :id => reception_categories(:one).to_param
    end

    assert_redirected_to reception_categories_path
  end
end
