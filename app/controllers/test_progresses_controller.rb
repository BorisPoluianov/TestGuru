class TestProgressesController < ApplicationController
  before_action :find_test_progress, only: %i[show result update]

  def show
  end

  def result
  end

  def update
    @test_progress.accept!(params[:answer_ids])

    if @test_progress.completed?
      TestsMailer.completed_test(@test_progress).deliver_now
      redirect_to result_test_progress_path(@test_progress)
    else
      render :show
    end
  end

  private

  def find_test_progress
    @test_progress = TestProgress.find(params[:id])
  end
end
