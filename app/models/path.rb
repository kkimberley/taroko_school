class Path < ApplicationRecord
  before_create :generate_url

  def generate_url
    self.url = self.title.gsub('/','-').downcase
  end
end
