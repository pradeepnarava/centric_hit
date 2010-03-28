require 'test_helper'

class SlittingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slittings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slitting" do
    assert_difference('Slitting.count') do
      post :create, :slitting => { }
    end

    assert_redirected_to slitting_path(assigns(:slitting))
  end

  test "should show slitting" do
    get :show, :id => slittings(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => slittings(:one).id
    assert_response :success
  end

  test "should update slitting" do
    put :update, :id => slittings(:one).id, :slitting => { }
    assert_redirected_to slitting_path(assigns(:slitting))
  end

  test "should destroy slitting" do
    assert_difference('Slitting.count', -1) do
      delete :destroy, :id => slittings(:one).id
    end

    assert_redirected_to slittings_path
  end
end
