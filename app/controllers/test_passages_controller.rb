class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      link_to_gist = view_context.link_to "Gist", result.gist_url
      flash[:notice] = t('.success', link: link_to_gist)

      @gist = current_user.gists.create!(gist_url: result.gist_url, question: @test_passage.current_question)
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      service = CheckForBadgesService.new(current_user, @test_passage)
      badges = service.call
      current_user.badges << badges
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
