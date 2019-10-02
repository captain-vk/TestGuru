# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true

  has_many :questions, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy
  has_many :results, dependent: :destroy

  validates :title, presence: true  
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }      
  scope :middle, -> { where(level: 2..4) }    
  scope :hard, -> { where(level: 5..Float::INFINITY) }            	
  
  def self.by_test(category_name)
    joins(:category)
      .where(categories: { title: category_name }).order(id: :desc).pluck(:title)
  end


end
