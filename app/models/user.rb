# frozen_string_literal: true

require 'digest/sha1'

class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify

  has_secure_password

  validates :email, uniqueness: true, format: { with: /[A-Za-z0-9]*@[A-Za-z]*\.[A-Za-z]*/, message: 'Почта некорректна!' }
  validates :password, presence: true, if: proc { |u| u.password_digest.blank? }
  validates :password, confirmation: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  private

  def search_test(level)
    tests.search_by_level(level)
  end
end
