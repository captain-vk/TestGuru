# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passage, dependent: :destroy
  has_many :tests, through: :test_passage, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify

  validates :login, :password, presence: true

  def search_test(level)
    tests.search_by_level(level)
  end
end
