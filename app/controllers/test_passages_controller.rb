class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist]

  def show

  end

  def result

  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    gist_service = ResultOfConnection.new(result)

    if gist_service.success?
      link_to_gist = view_context.link_to "Gist", result[:html_url]
      flash[:notice] =  t('.success') + link_to_gist

      @gist = Gist.new(question_id: @test_passage.current_question.id,
                       gist_url: gist_service.gist_url,
                       user_id: current_user.id)
      @gist.save!
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
