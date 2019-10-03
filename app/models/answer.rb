# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_count_answers

  scope :correct, -> { where(correct: true) }

private

  def validate_count_answers
    errors.add(:base, 'Answers > 4!') if question.answers.length > 4 
  end  
end
