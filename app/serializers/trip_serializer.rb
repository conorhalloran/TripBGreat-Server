class TripSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :location, :start_date, :end_date, :duration, :aasm_state, :user_id, :longitude, :latitude, :days
  belongs_to :user
  has_many :days

  # def duration
  #   (object.end_date.to_date - object.start_date.to_date).to_i
  # end

  # def start_date
  #   object.start_date.strftime('%Y-%B-%d')
  # end

  # def end_date
  #   object.end_date.strftime('%Y-%B-%d')
  # end

  def user
    User.find_by(id: self.object.user_id)
  end
  # def user
  #   object.user_id.full_name
  # end

  def days 
    object.days
  end
  
end
