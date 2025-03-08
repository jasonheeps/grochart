class CirclesController < ApplicationController
  def new
    @circle = Circle.new
  end

  def circle_params
    params.require(:organization).permit(:name, :acronym, :parent_id)
  end
end
