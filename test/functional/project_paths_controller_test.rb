require 'test_helper'

class ProjectPathsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_paths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_path" do
    assert_difference('ProjectPath.count') do
      post :create, :project_path => { }
    end

    assert_redirected_to project_path_path(assigns(:project_path))
  end

  test "should show project_path" do
    get :show, :id => project_paths(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => project_paths(:one).to_param
    assert_response :success
  end

  test "should update project_path" do
    put :update, :id => project_paths(:one).to_param, :project_path => { }
    assert_redirected_to project_path_path(assigns(:project_path))
  end

  test "should destroy project_path" do
    assert_difference('ProjectPath.count', -1) do
      delete :destroy, :id => project_paths(:one).to_param
    end

    assert_redirected_to project_paths_path
  end
end
