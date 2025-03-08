class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
    # TODO: Remove this print
    print "def 'new' in OrganizationsController called!"
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.assign_url_token
    if @organization.save
      # TODO: redirect to organizations/url_token
      redirect_to organization_path(@organization)
    else
      render :new
    end
  end

  def show
    # TODO: Remove redundant line after fixing the problem
    @organization = Organization.find_by_id(params[:id])
    # @organization = Organization.find_by(url_token: params[:url_token])
  end

  def organization_params
    params.require(:organization).permit(:name)
    # TODO: Remove redundant line after fixing the problem
    # params.require(:organization).permit(:name, :url_token)
  end
end
