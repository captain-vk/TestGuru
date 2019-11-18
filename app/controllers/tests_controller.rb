# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: %w[start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def create_gist!(url)
    current_user.gists.create!(question: @test_passage.current_question, url: url)
  end
end
