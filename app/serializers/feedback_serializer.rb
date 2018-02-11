class FeedbackSerializer < ActiveModel::Serializer

  attributes :ratable_id, :ratable_type, :rating, :comment

end
