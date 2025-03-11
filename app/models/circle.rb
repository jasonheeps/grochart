class Circle < ApplicationRecord
  belongs_to :organization, class_name: 'Organization'

  def organization
    Organization.find_by_id(:organization_id)
  end
end
