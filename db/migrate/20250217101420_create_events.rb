class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.datetime :start_date, null: false
      t.integer :duration, null: false
      t.string :location, null: false
      t.decimal :price, precision: 8, scale: 2, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
