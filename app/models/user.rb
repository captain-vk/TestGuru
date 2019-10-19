# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify

  validates :login, :password, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def search_test(level)
    tests.search_by_level(level)
  end
end
