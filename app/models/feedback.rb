class Feedback < ApplicationRecord

  # ---------------------------------------------------------------------
  # => FIELDS
  # ---------------------------------------------------------------------

  # field :rating, type: Integer
  # field :comment, type: String

  # field :ratable_type, type: String
  # field :ratable_id, type: Integer


  # ---------------------------------------------------------------------
  # => RELATIONSHIPS
  # ---------------------------------------------------------------------

  belongs_to :ratable, polymorphic: true

end
