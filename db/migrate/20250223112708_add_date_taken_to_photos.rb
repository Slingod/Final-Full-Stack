class AddDateTakenToPhotos < ActiveRecord::Migration[8.0]
  def change
    add_column :photos, :date_taken, :datetime
  end
end
