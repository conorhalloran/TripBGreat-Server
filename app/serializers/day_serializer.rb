class DaySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date, :start_location, :start_latitude, :start_longitude, :end_location, :end_latitude, :end_longitude, :user
  has_one :user
  has_one :trip
end
