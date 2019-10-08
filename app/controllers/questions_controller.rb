class QuestionsController < ApplicationController
  def index
    # render plain: 'All questions'
    @test = Test.find(params[:test_id])
    render json: @test.questions
  end   

  def show
    @question = Question.find(params[:id])
    render plain: @question.body
  end

  def new
    @test = Test.find(params[:test_id])
  end

  def create
    question = Question.create(question_params)
    render plain: question.inspect
  end

private

  def question_params
    params.require(:question).permit(:body)
  end
end
