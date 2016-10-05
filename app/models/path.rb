class Path < ApplicationRecord
  has_many :courses
  
  def to_param
    title
  end
end
