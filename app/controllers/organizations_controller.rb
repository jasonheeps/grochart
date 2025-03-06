class OrganizationsController < ApplicationController
  def new
    print "def 'new' in OrganizationsController called!"
    @organization = Organization.new
  end

  def organization_params
    params.require(:organization).permit(:name, :url_token)
  end
end
