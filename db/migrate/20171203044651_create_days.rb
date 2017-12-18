class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.string :title
      t.text :description
      t.string :date
      t.string :start_location
      t.float :start_latitude
      t.float :start_longitude
      t.string :end_location
      t.float :end_latitude
      t.float :end_longitude
      t.references :user, foreign_key: true
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
