class Mission < ApplicationRecord
  belongs_to :course

  scope :finished, -> { where(if_finish: true) }

  def to_param
    title
  end

  def finish?
    result = self.if_finish ? "Finished" : "Not Finished"
  end
end
