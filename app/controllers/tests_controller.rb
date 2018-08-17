class TestsController < ApplicationController
  before_action :select_test, only: %i[show edit update destroy start]
  before_action :set_user, only: %i[start]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test, notice: "Successfully created!"
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test, notice: "Successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path, notice: "Succesfully deleted"
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def select_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end

  def set_user
    @user = User.first
  end
end
