class TestsController < ApplicationController
  before_action :select_test, only: %i[show edit update destroy]

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

  private

  def select_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end
end
