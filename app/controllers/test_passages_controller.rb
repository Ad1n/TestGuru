class TestPassagesController < ApplicationController

  include ActionView::Helpers::SanitizeHelper

  before_action :set_test_passage, only: %i[show update result gist]
  before_action -> { flash.now[:notice] = flash[:notice].html_safe if flash[:html_safe] && flash[:notice] }

  def show

  end

  def result

  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    link_to_gist = %Q(<a href="#{result[:html_url]}"> GIST </a>)
    flash_options = if result[:html_url].nil?
                      { alert: t('.failure') }
                    else
                      { notice: t('.success') + link_to_gist }
                    end

    if result[:html_url]
      @gist = Gist.new(question: @test_passage.current_question.body,
                       question_id: @test_passage.current_question.id,
                       gist_url: result[:html_url],
                       email: current_user.email,
                       user_id: current_user.id)
      @gist.save!
    end

    redirect_to @test_passage, flash_options
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
