class Admin::TestsController < Admin::BaseController

  before_action :select_test, only: %i[show edit update destroy start]

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
    @test = current_user.created_test.new(test_params)
    byebug
    if @test.save
      redirect_to admin_test_path(@test), notice: "Successfully created!"
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test), notice: "Successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: "Succesfully deleted"
  end

  private

  def select_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

end
