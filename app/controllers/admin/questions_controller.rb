class Admin::QuestionsController < Admin::BaseController

  before_action :select_test, only: %i[create new]
  before_action :select_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
  end

  def new
    @question = @test.questions.new
  end

  def edit
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to admin_test_path(@test.id), notice: "Successfully created!"
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question), notice: "Successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test), notice: "Succesfully deleted"
  end

  private

  def select_question
    @question = Question.find(params[:id])
  end

  def select_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found = ('
  end
end
