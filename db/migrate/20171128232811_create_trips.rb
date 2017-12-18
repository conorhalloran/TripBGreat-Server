class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :title
      t.string :description
      t.string :location
      t.string :start_date
      t.string :end_date
      t.integer :duration
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
