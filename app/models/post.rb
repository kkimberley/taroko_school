class Post < ApplicationRecord
  scope :unsort, -> { where(course_id: nil) }
end
