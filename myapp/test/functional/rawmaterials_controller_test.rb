require 'test_helper'

class RawmaterialsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rawmaterials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rawmaterial" do
    assert_difference('Rawmaterial.count') do
      post :create, :rawmaterial => { }
    end

    assert_redirected_to rawmaterial_path(assigns(:rawmaterial))
  end

  test "should show rawmaterial" do
    get :show, :id => rawmaterials(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rawmaterials(:one).id
    assert_response :success
  end

  test "should update rawmaterial" do
    put :update, :id => rawmaterials(:one).id, :rawmaterial => { }
    assert_redirected_to rawmaterial_path(assigns(:rawmaterial))
  end

  test "should destroy rawmaterial" do
    assert_difference('Rawmaterial.count', -1) do
      delete :destroy, :id => rawmaterials(:one).id
    end

    assert_redirected_to rawmaterials_path
  end
end
