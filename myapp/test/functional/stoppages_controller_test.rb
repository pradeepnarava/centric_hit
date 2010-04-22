require 'test_helper'

class StoppagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stoppages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stoppage" do
    assert_difference('Stoppage.count') do
      post :create, :stoppage => { }
    end

    assert_redirected_to stoppage_path(assigns(:stoppage))
  end

  test "should show stoppage" do
    get :show, :id => stoppages(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => stoppages(:one).id
    assert_response :success
  end

  test "should update stoppage" do
    put :update, :id => stoppages(:one).id, :stoppage => { }
    assert_redirected_to stoppage_path(assigns(:stoppage))
  end

  test "should destroy stoppage" do
    assert_difference('Stoppage.count', -1) do
      delete :destroy, :id => stoppages(:one).id
    end

    assert_redirected_to stoppages_path
  end
end
