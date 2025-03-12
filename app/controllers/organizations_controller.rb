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
    @organization = Organization.find_by(url_token: params[:url_token])
  end

  private

  # NOTE: There is a difference between
  # - organization_params (what the user enters in a form, e.g. 'name') and
  # - params (variables read from the URL, e.g. 'url_token').
  # 'Strong params' (like 'organization_params') force you to whitelist the
  # attributes that can be saved to the db
  def organization_params
    params.require(:organization).permit(:name)
  end
end
