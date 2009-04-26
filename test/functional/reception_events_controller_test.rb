require 'test_helper'

class ReceptionEventsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reception_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reception_event" do
    assert_difference('ReceptionEvent.count') do
      post :create, :reception_event => { }
    end

    assert_redirected_to reception_event_path(assigns(:reception_event))
  end

  test "should show reception_event" do
    get :show, :id => reception_events(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => reception_events(:one).to_param
    assert_response :success
  end

  test "should update reception_event" do
    put :update, :id => reception_events(:one).to_param, :reception_event => { }
    assert_redirected_to reception_event_path(assigns(:reception_event))
  end

  test "should destroy reception_event" do
    assert_difference('ReceptionEvent.count', -1) do
      delete :destroy, :id => reception_events(:one).to_param
    end

    assert_redirected_to reception_events_path
  end
end
