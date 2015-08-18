class PlayerSerializer < ApplicationSerializer
  attributes :id, :type, :team_id, :name, :created_at, :updated_at
  has_one :team
  
  def include_team?
    options[:include_team] == true
  end
end
