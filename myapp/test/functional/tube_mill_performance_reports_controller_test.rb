require 'test_helper'

class TubeMillPerformanceReportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tube_mill_performance_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tube_mill_performance_report" do
    assert_difference('TubeMillPerformanceReport.count') do
      post :create, :tube_mill_performance_report => { }
    end

    assert_redirected_to tube_mill_performance_report_path(assigns(:tube_mill_performance_report))
  end

  test "should show tube_mill_performance_report" do
    get :show, :id => tube_mill_performance_reports(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tube_mill_performance_reports(:one).id
    assert_response :success
  end

  test "should update tube_mill_performance_report" do
    put :update, :id => tube_mill_performance_reports(:one).id, :tube_mill_performance_report => { }
    assert_redirected_to tube_mill_performance_report_path(assigns(:tube_mill_performance_report))
  end

  test "should destroy tube_mill_performance_report" do
    assert_difference('TubeMillPerformanceReport.count', -1) do
      delete :destroy, :id => tube_mill_performance_reports(:one).id
    end

    assert_redirected_to tube_mill_performance_reports_path
  end
end
