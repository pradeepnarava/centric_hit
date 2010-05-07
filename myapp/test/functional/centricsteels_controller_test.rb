require 'test_helper'

class CentricsteelsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:centricsteels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create centricsteel" do
    assert_difference('Centricsteel.count') do
      post :create, :centricsteel => { }
    end

    assert_redirected_to centricsteel_path(assigns(:centricsteel))
  end

  test "should show centricsteel" do
    get :show, :id => centricsteels(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => centricsteels(:one).to_param
    assert_response :success
  end

  test "should update centricsteel" do
    put :update, :id => centricsteels(:one).to_param, :centricsteel => { }
    assert_redirected_to centricsteel_path(assigns(:centricsteel))
  end

  test "should destroy centricsteel" do
    assert_difference('Centricsteel.count', -1) do
      delete :destroy, :id => centricsteels(:one).to_param
    end

    assert_redirected_to centricsteels_path
  end
end
