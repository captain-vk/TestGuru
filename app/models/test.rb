class Test < ApplicationRecord
  def self.by_test(category_name)
    joins('INNER JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: category_name })
  end
end
