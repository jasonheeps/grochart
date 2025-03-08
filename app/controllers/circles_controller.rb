class CirclesController < ApplicationController
  def new
    # TODO: remove the print
    print "def 'new' in CirclesController called!"
    @circle = Circle.new
  end

  def organization_params
    params.require(:organization).permit(:name, :acronym, :parent_id)
  end
end
