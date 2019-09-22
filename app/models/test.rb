class Test < ApplicationRecord
	def self.list_of_test(name)
      joins(Category)
  end
end
