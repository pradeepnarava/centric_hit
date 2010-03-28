require 'test_helper'

class UncoilerReportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uncoiler_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uncoiler_report" do
    assert_difference('UncoilerReport.count') do
      post :create, :uncoiler_report => { }
    end

    assert_redirected_to uncoiler_report_path(assigns(:uncoiler_report))
  end

  test "should show uncoiler_report" do
    get :show, :id => uncoiler_reports(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => uncoiler_reports(:one).id
    assert_response :success
  end

  test "should update uncoiler_report" do
    put :update, :id => uncoiler_reports(:one).id, :uncoiler_report => { }
    assert_redirected_to uncoiler_report_path(assigns(:uncoiler_report))
  end

  test "should destroy uncoiler_report" do
    assert_difference('UncoilerReport.count', -1) do
      delete :destroy, :id => uncoiler_reports(:one).id
    end

    assert_redirected_to uncoiler_reports_path
  end
end
