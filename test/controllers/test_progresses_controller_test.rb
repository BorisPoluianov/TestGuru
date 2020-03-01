require 'test_helper'

class TestProgressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_progress = test_progresses(:one)
  end

  test "should get index" do
    get test_progresses_url
    assert_response :success
  end

  test "should get new" do
    get new_test_progress_url
    assert_response :success
  end

  test "should create test_progress" do
    assert_difference('TestProgress.count') do
      post test_progresses_url, params: { test_progress: {  } }
    end

    assert_redirected_to test_progress_url(TestProgress.last)
  end

  test "should show test_progress" do
    get test_progress_url(@test_progress)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_progress_url(@test_progress)
    assert_response :success
  end

  test "should update test_progress" do
    patch test_progress_url(@test_progress), params: { test_progress: {  } }
    assert_redirected_to test_progress_url(@test_progress)
  end

  test "should destroy test_progress" do
    assert_difference('TestProgress.count', -1) do
      delete test_progress_url(@test_progress)
    end

    assert_redirected_to test_progresses_url
  end
end
