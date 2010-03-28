require 'test_helper'

class RawmaterialCategoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rawmaterial_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rawmaterial_category" do
    assert_difference('RawmaterialCategory.count') do
      post :create, :rawmaterial_category => { }
    end

    assert_redirected_to rawmaterial_category_path(assigns(:rawmaterial_category))
  end

  test "should show rawmaterial_category" do
    get :show, :id => rawmaterial_categories(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rawmaterial_categories(:one).id
    assert_response :success
  end

  test "should update rawmaterial_category" do
    put :update, :id => rawmaterial_categories(:one).id, :rawmaterial_category => { }
    assert_redirected_to rawmaterial_category_path(assigns(:rawmaterial_category))
  end

  test "should destroy rawmaterial_category" do
    assert_difference('RawmaterialCategory.count', -1) do
      delete :destroy, :id => rawmaterial_categories(:one).id
    end

    assert_redirected_to rawmaterial_categories_path
  end
end
