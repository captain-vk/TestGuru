# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true

  has_many :questions, dependent: :destroy
  has_many :test_passage, dependent: :destroy
  has_many :users, through: :test_passage, dependent: :destroy

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level, message: 'Error! Enter a different name' }

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :search_by_level, ->(level) { where(level: level) }
  scope :search_by_category, ->(name) { joins(:category).where(categories: { title: name }).order(id: :desc) }

  def self.by_test(category_name)
    search_by_category(category_name).pluck(:title)
  end
end
