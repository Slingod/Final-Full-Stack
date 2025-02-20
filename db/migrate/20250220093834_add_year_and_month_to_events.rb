class AddYearAndMonthToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :year, :integer
    add_column :events, :month, :integer
  end
end
