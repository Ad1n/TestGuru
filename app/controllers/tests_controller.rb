class TestsController < ApplicationController

  # skip_before_action :authenticate_user!, only: %i[index]
  before_action :select_test, only: %i[start]
  # skip_before_action :set_user, except: %i[index start]

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def select_test
    @test = Test.find(params[:id])
  end
end
