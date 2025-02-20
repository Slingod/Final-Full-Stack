class AddDetailsToEvents < ActiveRecord::Migration[8.0]
  def change
    unless column_exists?(:events, :year)
      add_column :events, :year, :integer
    end

    unless column_exists?(:events, :month)
      add_column :events, :month, :integer
    end

    unless column_exists?(:events, :day)
      add_column :events, :day, :integer
    end

    unless column_exists?(:events, :hour)
      add_column :events, :hour, :integer
    end

    unless column_exists?(:events, :minute)
      add_column :events, :minute, :integer
    end
  end
end
