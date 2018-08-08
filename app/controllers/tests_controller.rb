class TestsController < ApplicationController
  before_action :select_test, except: %i[index]

  def index
    @tests = Test.all.pluck('title')
    render inline: '<%= @tests %>'
  end

  def show
    render inline: '<%= @test.title %>'
  end

  private

  def select_test
    @test = Test.find(params[:id])
  end

end
