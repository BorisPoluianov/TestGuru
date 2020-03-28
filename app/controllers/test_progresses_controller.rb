class TestProgressesController < ApplicationController
  before_action :find_test_progress, only: %i[show result update gist]

  def show
  end

  def result
  end

  def update
    @test_progress.accept!(params[:answer_ids])

    if @test_progress.completed?
      BadgesService.new(@test_progress).call if @test_progress.passed
      TestsMailer.completed_test(@test_progress).deliver_now
      redirect_to result_test_progress_path(@test_progress)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_progress.current_question)
    response = service.call

    flash_options = if service.success?
                      create_gist!(response.html_url)
                      { notice: response.html_url }
                    else
                      { alert: t('.fail') }
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
