class Admin::TestsController < Admin::BaseController

  # skip_before_action :authenticate_user!, only: %i[index]
  before_action :select_test, only: %i[show edit update destroy start]
  # skip_before_action :set_user, except: %i[index start]

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
    @test.user_id = current_user.id
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

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def select_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end

end
