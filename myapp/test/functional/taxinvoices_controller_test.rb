require 'test_helper'

class TaxinvoicesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:taxinvoices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create taxinvoice" do
    assert_difference('Taxinvoice.count') do
      post :create, :taxinvoice => { }
    end

    assert_redirected_to taxinvoice_path(assigns(:taxinvoice))
  end

  test "should show taxinvoice" do
    get :show, :id => taxinvoices(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => taxinvoices(:one).id
    assert_response :success
  end

  test "should update taxinvoice" do
    put :update, :id => taxinvoices(:one).id, :taxinvoice => { }
    assert_redirected_to taxinvoice_path(assigns(:taxinvoice))
  end

  test "should destroy taxinvoice" do
    assert_difference('Taxinvoice.count', -1) do
      delete :destroy, :id => taxinvoices(:one).id
    end

    assert_redirected_to taxinvoices_path
  end
end
