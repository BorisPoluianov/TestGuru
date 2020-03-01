class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy start]
  before_action :find_user, only: %i[start]

  def index
    @tests = Test.all
  end

  def new
    @test = Test.build
  end

  def create
    @test = Test.build(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_progress(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = User.first
  end
end
