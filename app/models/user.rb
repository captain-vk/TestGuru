# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tests, through: :results, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify

  def search_test(level)
    tests.where(tests: { level: level })
  end
end
