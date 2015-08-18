class PlayerSerializer < ApplicationSerializer
  attributes :id, :type, :name, :created_at, :updated_at
  # has_one :team
end
