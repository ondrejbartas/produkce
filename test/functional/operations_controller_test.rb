require 'test_helper'

class OperationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operation" do
    assert_difference('Operation.count') do
      post :create, :operation => { }
    end

    assert_redirected_to operation_path(assigns(:operation))
  end

  test "should show operation" do
    get :show, :id => operations(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => operations(:one).id
    assert_response :success
  end

  test "should update operation" do
    put :update, :id => operations(:one).id, :operation => { }
    assert_redirected_to operation_path(assigns(:operation))
  end

  test "should destroy operation" do
    assert_difference('Operation.count', -1) do
      delete :destroy, :id => operations(:one).id
    end

    assert_redirected_to operations_path
  end
end
