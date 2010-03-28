require 'test_helper'

class SalesplansControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salesplans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salesplan" do
    assert_difference('Salesplan.count') do
      post :create, :salesplan => { }
    end

    assert_redirected_to salesplan_path(assigns(:salesplan))
  end

  test "should show salesplan" do
    get :show, :id => salesplans(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => salesplans(:one).id
    assert_response :success
  end

  test "should update salesplan" do
    put :update, :id => salesplans(:one).id, :salesplan => { }
    assert_redirected_to salesplan_path(assigns(:salesplan))
  end

  test "should destroy salesplan" do
    assert_difference('Salesplan.count', -1) do
      delete :destroy, :id => salesplans(:one).id
    end

    assert_redirected_to salesplans_path
  end
end
