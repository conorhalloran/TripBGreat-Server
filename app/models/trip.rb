class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_users, dependent: :destroy
  has_many :users, through: :trip_users
  has_many :days, dependent: :destroy
  validates :title, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  # validates :users, uniqueness: { scope: :user}
  before_save :set_duration

  include AASM 

    aasm whiny_transitions: false do
      state :pending, initial: true 
      state :published
      state :in_progress
      state :completed

      event :publish do 
        transitions from: :pending, to: :published
      end 

      event :mark_in_progress do 
        transitions from: :published, to: :in_progress
      end

      event :archive do 
        transitions from: [:published, :in_progress], to: :completed
      end 

    end

    private 

    def set_duration
      self.duration = (self.end_date.to_date - self.start_date.to_date).to_i
    end
end
