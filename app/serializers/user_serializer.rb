class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :auth_token, :is_admin
end
