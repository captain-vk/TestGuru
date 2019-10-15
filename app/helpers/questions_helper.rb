# frozen_string_literal: true

module QuestionsHelper
  def header_creator(question)
    header = question.persisted? ? 'Edit' : 'Create New'
    "#{header} '#{@question.test.title}' Test Question"
  end
end