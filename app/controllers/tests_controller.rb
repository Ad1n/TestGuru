class TestsController < ApplicationController
  before_action :find_test, except: %i[index]

  def index
    @tests = Test.all.pluck('title')
    render inline: '<%= @tests %>'
  end

  def show
    render inline: '<%= @test.title %>'
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

end
