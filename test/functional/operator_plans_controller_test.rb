require 'test_helper'

class OperatorPlansControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operator_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operator_plan" do
    assert_difference('OperatorPlan.count') do
      post :create, :operator_plan => { }
    end

    assert_redirected_to operator_plan_path(assigns(:operator_plan))
  end

  test "should show operator_plan" do
    get :show, :id => operator_plans(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => operator_plans(:one).to_param
    assert_response :success
  end

  test "should update operator_plan" do
    put :update, :id => operator_plans(:one).to_param, :operator_plan => { }
    assert_redirected_to operator_plan_path(assigns(:operator_plan))
  end

  test "should destroy operator_plan" do
    assert_difference('OperatorPlan.count', -1) do
      delete :destroy, :id => operator_plans(:one).to_param
    end

    assert_redirected_to operator_plans_path
  end
end
