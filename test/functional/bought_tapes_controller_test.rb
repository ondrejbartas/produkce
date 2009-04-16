require 'test_helper'

class BoughtTapesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bought_tapes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bought_tape" do
    assert_difference('BoughtTape.count') do
      post :create, :bought_tape => { }
    end

    assert_redirected_to bought_tape_path(assigns(:bought_tape))
  end

  test "should show bought_tape" do
    get :show, :id => bought_tapes(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bought_tapes(:one).id
    assert_response :success
  end

  test "should update bought_tape" do
    put :update, :id => bought_tapes(:one).id, :bought_tape => { }
    assert_redirected_to bought_tape_path(assigns(:bought_tape))
  end

  test "should destroy bought_tape" do
    assert_difference('BoughtTape.count', -1) do
      delete :destroy, :id => bought_tapes(:one).id
    end

    assert_redirected_to bought_tapes_path
  end
end
