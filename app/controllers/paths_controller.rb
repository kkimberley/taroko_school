class PathsController < ApplicationController
  def index
    @paths = Path.all
  end
end
