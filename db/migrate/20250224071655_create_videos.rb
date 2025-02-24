class CreateVideos < ActiveRecord::Migration[8.0]
  def change
    create_table :videos do |t|
      t.references :event, null: false, foreign_key: true
      t.string :url
      t.datetime :date_taken

      t.timestamps
    end
  end
end
