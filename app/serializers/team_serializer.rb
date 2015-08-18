class TeamSerializer < ActiveModel::Serializer
  attributes :id, :type, :name, :created_at, :updated_at
  # attribute :name, key: :full_name

  # ClassName -> class-name
  def type
    object.class.name.parameterize
  end

  def created_at
    object.created_at.to_s
  end

  def updated_at
    object.updated_at.to_s
  end
end
