class AddTestsDefaultValue < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:tests, :level, from: nil, to: 7)
  end
end
