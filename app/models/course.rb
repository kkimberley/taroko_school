class Course < ApplicationRecord
  belongs_to :path

  def to_param
    title
  end
end
