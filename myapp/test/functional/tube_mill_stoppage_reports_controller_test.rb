require 'test_helper'

class TubeMillStoppageReportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tube_mill_stoppage_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tube_mill_stoppage_report" do
    assert_difference('TubeMillStoppageReport.count') do
      post :create, :tube_mill_stoppage_report => { }
    end

    assert_redirected_to tube_mill_stoppage_report_path(assigns(:tube_mill_stoppage_report))
  end

  test "should show tube_mill_stoppage_report" do
    get :show, :id => tube_mill_stoppage_reports(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tube_mill_stoppage_reports(:one).id
    assert_response :success
  end

  test "should update tube_mill_stoppage_report" do
    put :update, :id => tube_mill_stoppage_reports(:one).id, :tube_mill_stoppage_report => { }
    assert_redirected_to tube_mill_stoppage_report_path(assigns(:tube_mill_stoppage_report))
  end

  test "should destroy tube_mill_stoppage_report" do
    assert_difference('TubeMillStoppageReport.count', -1) do
      delete :destroy, :id => tube_mill_stoppage_reports(:one).id
    end

    assert_redirected_to tube_mill_stoppage_reports_path
  end
end
