# frozen_string_literal: true

class Category < ApplicationRecord
  default_scope { order(title: :asc) }	

  has_many :tests, dependent: :nullify

  validates :title, presence: true
  # scope :search_by_category, ->(name) { where{ title: name }).

end
