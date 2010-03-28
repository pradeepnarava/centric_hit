require 'test_helper'

class SlittingproductionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slittingproductions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slittingproduction" do
    assert_difference('Slittingproduction.count') do
      post :create, :slittingproduction => { }
    end

    assert_redirected_to slittingproduction_path(assigns(:slittingproduction))
  end

  test "should show slittingproduction" do
    get :show, :id => slittingproductions(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => slittingproductions(:one).id
    assert_response :success
  end

  test "should update slittingproduction" do
    put :update, :id => slittingproductions(:one).id, :slittingproduction => { }
    assert_redirected_to slittingproduction_path(assigns(:slittingproduction))
  end

  test "should destroy slittingproduction" do
    assert_difference('Slittingproduction.count', -1) do
      delete :destroy, :id => slittingproductions(:one).id
    end

    assert_redirected_to slittingproductions_path
  end
end
