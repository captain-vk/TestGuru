class User < ApplicationRecord
   def search_test(level)
    Test.where({ level: level })
   end  
end
