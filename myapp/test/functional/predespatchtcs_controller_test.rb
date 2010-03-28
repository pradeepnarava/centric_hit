require 'test_helper'

class PredespatchtcsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:predespatchtcs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create predespatchtc" do
    assert_difference('Predespatchtc.count') do
      post :create, :predespatchtc => { }
    end

    assert_redirected_to predespatchtc_path(assigns(:predespatchtc))
  end

  test "should show predespatchtc" do
    get :show, :id => predespatchtcs(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => predespatchtcs(:one).id
    assert_response :success
  end

  test "should update predespatchtc" do
    put :update, :id => predespatchtcs(:one).id, :predespatchtc => { }
    assert_redirected_to predespatchtc_path(assigns(:predespatchtc))
  end

  test "should destroy predespatchtc" do
    assert_difference('Predespatchtc.count', -1) do
      delete :destroy, :id => predespatchtcs(:one).id
    end

    assert_redirected_to predespatchtcs_path
  end
end
