require 'test_helper'

class SerializesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:serializes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create serialize" do
    assert_difference('Serialize.count') do
      post :create, :serialize => { }
    end

    assert_redirected_to serialize_path(assigns(:serialize))
  end

  test "should show serialize" do
    get :show, :id => serializes(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => serializes(:one).id
    assert_response :success
  end

  test "should update serialize" do
    put :update, :id => serializes(:one).id, :serialize => { }
    assert_redirected_to serialize_path(assigns(:serialize))
  end

  test "should destroy serialize" do
    assert_difference('Serialize.count', -1) do
      delete :destroy, :id => serializes(:one).id
    end

    assert_redirected_to serializes_path
  end
end
