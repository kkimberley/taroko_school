class Path < ApplicationRecord
  def to_param
    title
  end
end
