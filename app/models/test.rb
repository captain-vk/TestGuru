# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :categories
  has_many :questions

  has_many :users, through: :results
  has_many :results
  def self.by_test(category_name)
    joins('INNER JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: category_name }).order(id: :desc).pluck(:title)
  end
end
