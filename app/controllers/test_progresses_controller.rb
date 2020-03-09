class TestProgressesController < ApplicationController
  before_action :find_test_progress, only: %i[show result update gist]

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

  def gist
    result = GistQuestionService.new(@test_progress.current_question).call

    flash_options = if result
                      create_gist!(result.html_url)
                      { notice: result.html_url }
                    else
                      { alert: t('.failure') }
                    end
    redirect_to @test_progress, flash_options
  end

  private

  def find_test_progress
    @test_progress = TestProgress.find(params[:id])
  end

  def create_gist!(url)
    current_user.gists.create!(
      question: @test_progress.current_question,
      url: url
    )
  end
end
