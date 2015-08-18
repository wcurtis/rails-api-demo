class ApplicationSerializer < ActiveModel::Serializer

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
