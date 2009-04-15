require 'test_helper'

class InvoiceOperationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoice_operations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoice_operation" do
    assert_difference('InvoiceOperation.count') do
      post :create, :invoice_operation => { }
    end

    assert_redirected_to invoice_operation_path(assigns(:invoice_operation))
  end

  test "should show invoice_operation" do
    get :show, :id => invoice_operations(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => invoice_operations(:one).id
    assert_response :success
  end

  test "should update invoice_operation" do
    put :update, :id => invoice_operations(:one).id, :invoice_operation => { }
    assert_redirected_to invoice_operation_path(assigns(:invoice_operation))
  end

  test "should destroy invoice_operation" do
    assert_difference('InvoiceOperation.count', -1) do
      delete :destroy, :id => invoice_operations(:one).id
    end

    assert_redirected_to invoice_operations_path
  end
end
