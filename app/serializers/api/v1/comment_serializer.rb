class Api::V1::CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :user

  def user
    object.user
  end

end
