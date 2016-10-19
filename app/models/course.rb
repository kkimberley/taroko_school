class Course < ApplicationRecord
  belongs_to :path
  has_many :posts

  def to_param
    title
  end
end
