# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    service.call
    if service.success?
      @gist = Gist.create!(url: service.response[:html_url], question: @test_passage.current_question, user: @test_passage.user)
      redirect_to @test_passage, notice: t('.success', url: @gist.url)
    else
      redirect_to @test_passage, alert: t('.failure')
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
