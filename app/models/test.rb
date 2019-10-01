# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true

  has_many :questions, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy
  has_many :results, dependent: :destroy
  
  def self.by_test(category_name)
    joins(:category)
      .where(categories: { title: category_name }).order(id: :desc).pluck(:title)
  end
end
