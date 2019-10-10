class TestsController < ApplicationController

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])    
    @questions = @test.questions.all
  end

  def new
    @test = Test.new
  end


end
