class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.assign_url_token
    if @organization.save
      redirect_to organization_path(@organization)
    else
      render :new
    end
  end

  def show
    # TODO: Find out why it's not 'params[:url_token]'
    @organization = Organization.find_by(params[:organization_id])
  end

  def organization_params
    params.require(:organization).permit(:name)
  end
end
