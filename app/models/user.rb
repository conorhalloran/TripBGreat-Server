class User < ApplicationRecord
    has_many :trip_users
    has_many :trips, through: :trip_users
    
    has_many :friendships
    has_many :friends, through: :friendships, source: :user

    before_save { self.email = email.downcase }
    validates :first_name, presence: true
    validates :last_name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true,
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    def full_name
        "#{first_name} #{last_name}".titleize
    end
end
