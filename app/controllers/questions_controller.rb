# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %w[new create]
  before_action :find_question, only: %w[show edit update destroy]
  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: @test.questions
  end

  def show
    render plain: @question.body
  end

  def edit; end

  def new;  end

  def create
    @question = @test.questions.build(question_params)
    redirect_to @test if @question.save
  end

  def update
    if @test.question.update(question_params)
      redirect_to test_questions_path
    else
      render :edit
    end
  end

  def destroy
    @test.question.destroy
    redirect_to test_questions_path
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end  

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Не найдено!'
  end
end