class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index show new create]
  before_action :find_question, only: %i[show destroy]

  def index
    render plain: @test.questions.pluck(:id,:body)
  end

  def show
    render plain: @question.inspect
  end

  def new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      render inline: '<%= @question.body %> question was saved.'
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    render plain: 'Question was deleted.'
  end

private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = @test.questions.find(params[:id])
  end
  byebug
end
