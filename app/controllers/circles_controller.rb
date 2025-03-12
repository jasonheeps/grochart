class CirclesController < ApplicationController
  def new
    @circle = Circle.new
  end

  def create
    @circle = Circle.new(circle_params)
    @circle.organization_id = organization.id
    if @circle.save
      redirect_to organization_path(organization)
    else
      render :new
    end
  end

  def organization
    Organization.find_by(url_token: params[:url_token])
  end

  private

  def circle_params
    params.require(:circle).permit(:name)
    # params.require(:circle).permit(:name, :acronym, :parent_id, :organization_id)
  end
end
