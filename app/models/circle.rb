class Circle < ApplicationRecord
  # NOTE: The 'belongs_to' allows me to do: circle.organization = ...
  # It doesn't allow to call circle.organization though?!
  # But then a circle object REQUIRES an organization object in order to be saved to db
  # (not what I want)
  # belongs_to :organization, class_name: 'Organization'

  def organization
    Organization.find_by_id(:organization_id)
  end
end
