require 'test_helper'

class DeliverychallansControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deliverychallans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deliverychallan" do
    assert_difference('Deliverychallan.count') do
      post :create, :deliverychallan => { }
    end

    assert_redirected_to deliverychallan_path(assigns(:deliverychallan))
  end

  test "should show deliverychallan" do
    get :show, :id => deliverychallans(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => deliverychallans(:one).id
    assert_response :success
  end

  test "should update deliverychallan" do
    put :update, :id => deliverychallans(:one).id, :deliverychallan => { }
    assert_redirected_to deliverychallan_path(assigns(:deliverychallan))
  end

  test "should destroy deliverychallan" do
    assert_difference('Deliverychallan.count', -1) do
      delete :destroy, :id => deliverychallans(:one).id
    end

    assert_redirected_to deliverychallans_path
  end
end
