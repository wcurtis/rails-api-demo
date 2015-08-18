class PlayerSerializer < ApplicationSerializer
  attributes :id, :type, :team_id, :name, :created_at, :updated_at
  # has_one :team
end
