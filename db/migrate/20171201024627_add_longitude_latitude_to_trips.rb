class AddLongitudeLatitudeToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :longitude, :float
    add_column :trips, :latitude, :float
  end
end
