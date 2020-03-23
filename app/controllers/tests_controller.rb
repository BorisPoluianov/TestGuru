class TestsController < ApplicationController
  before_action :find_test, only: :start

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.available_tests
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_progress(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Requested resource not found'
  end
end
