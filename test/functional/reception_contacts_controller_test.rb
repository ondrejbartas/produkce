require 'test_helper'

class ReceptionContactsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reception_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reception_contact" do
    assert_difference('ReceptionContact.count') do
      post :create, :reception_contact => { }
    end

    assert_redirected_to reception_contact_path(assigns(:reception_contact))
  end

  test "should show reception_contact" do
    get :show, :id => reception_contacts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => reception_contacts(:one).to_param
    assert_response :success
  end

  test "should update reception_contact" do
    put :update, :id => reception_contacts(:one).to_param, :reception_contact => { }
    assert_redirected_to reception_contact_path(assigns(:reception_contact))
  end

  test "should destroy reception_contact" do
    assert_difference('ReceptionContact.count', -1) do
      delete :destroy, :id => reception_contacts(:one).to_param
    end

    assert_redirected_to reception_contacts_path
  end
end
