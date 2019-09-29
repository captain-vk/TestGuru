# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tests, through: :results
  has_many :results

  def search_test(level)
    Test.joins('INNER JOIN results ON results.test_id = tests.id')
        .where(results: { user_id: id }, tests: { level: level })
  end
end
