class User < ApplicationRecord
   def search_test(level)
   	Test.joins('INNER JOIN results ON results.test_id = tests.id')
   	.where(results: { user_id: id }, tests: { level: level })
   end  
end
