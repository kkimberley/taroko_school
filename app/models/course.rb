class Course < ApplicationRecord
  belongs_to :path
  has_many :missions

  def to_param
    title
  end
end
