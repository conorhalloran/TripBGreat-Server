class Day < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  # has_many :users, through: :trip_users
  # has_many :trip_users

end
