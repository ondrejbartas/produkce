require 'test_helper'

class DefinedOpearationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:defined_opearations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create defined_opearation" do
    assert_difference('DefinedOpearation.count') do
      post :create, :defined_opearation => { }
    end

    assert_redirected_to defined_opearation_path(assigns(:defined_opearation))
  end

  test "should show defined_opearation" do
    get :show, :id => defined_opearations(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => defined_opearations(:one).id
    assert_response :success
  end

  test "should update defined_opearation" do
    put :update, :id => defined_opearations(:one).id, :defined_opearation => { }
    assert_redirected_to defined_opearation_path(assigns(:defined_opearation))
  end

  test "should destroy defined_opearation" do
    assert_difference('DefinedOpearation.count', -1) do
      delete :destroy, :id => defined_opearations(:one).id
    end

    assert_redirected_to defined_opearations_path
  end
end
