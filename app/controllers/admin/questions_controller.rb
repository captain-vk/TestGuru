# frozen_string_literal: true

class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: %w[new create]
  before_action :find_question, only: %w[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def create
    @question = @test.questions.build(question_params)

    if @question.save
    flash['alert alert-info'] = 'Вопрос создан.'
    redirect_to [:admin, @question.test]
    else
      render :new
    end
  end

  def new
    @question = @test.questions.build
  end

  def edit; end

  def destroy
    flash['alert alert-info'] = 'Вопрос удален.'
    redirect_to [:admin, @question.test]
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
