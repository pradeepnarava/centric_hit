require 'test_helper'

class CustomerOrdersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_order" do
    assert_difference('CustomerOrder.count') do
      post :create, :customer_order => { }
    end

    assert_redirected_to customer_order_path(assigns(:customer_order))
  end

  test "should show customer_order" do
    get :show, :id => customer_orders(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => customer_orders(:one).id
    assert_response :success
  end

  test "should update customer_order" do
    put :update, :id => customer_orders(:one).id, :customer_order => { }
    assert_redirected_to customer_order_path(assigns(:customer_order))
  end

  test "should destroy customer_order" do
    assert_difference('CustomerOrder.count', -1) do
      delete :destroy, :id => customer_orders(:one).id
    end

    assert_redirected_to customer_orders_path
  end
end
