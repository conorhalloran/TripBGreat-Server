class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :trips, :friends

  def trips
    object.trips
  end

  def friends
    object.friendships
  end

end
