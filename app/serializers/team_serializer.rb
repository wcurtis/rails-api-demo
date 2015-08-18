class TeamSerializer < ApplicationSerializer
  attributes :id, :type, :name, :created_at, :updated_at
  # attribute :name, key: :full_name

  # has_many :players  
end
