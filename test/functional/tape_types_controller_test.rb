require 'test_helper'

class TapeTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tape_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tape_type" do
    assert_difference('TapeType.count') do
      post :create, :tape_type => { }
    end

    assert_redirected_to tape_type_path(assigns(:tape_type))
  end

  test "should show tape_type" do
    get :show, :id => tape_types(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tape_types(:one).id
    assert_response :success
  end

  test "should update tape_type" do
    put :update, :id => tape_types(:one).id, :tape_type => { }
    assert_redirected_to tape_type_path(assigns(:tape_type))
  end

  test "should destroy tape_type" do
    assert_difference('TapeType.count', -1) do
      delete :destroy, :id => tape_types(:one).id
    end

    assert_redirected_to tape_types_path
  end
end
