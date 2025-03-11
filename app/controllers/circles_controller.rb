class CirclesController < ApplicationController
  def new
    @circle = Circle.new
  end

  def create
    @circle = Circle.new(circle_params)
    @circle.organization = Organization.find_by_id(:organization_id)
    if @circle.save
      redirect_to organization_path(@circle.organization)
    else
      render :new
    end
  end

  # def assign_organization
  #   self.
  # end

  def circle_params
    params.require(:circle).permit(:name, :acronym, :parent_id, :organization_id)
  end
end
