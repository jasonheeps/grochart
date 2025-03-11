class AddOrganizationIdToCircles < ActiveRecord::Migration[6.0]
  def change
    change_table :circles do |t|
      t.column :organization_id, :bigint, null: false
    end
  end
end
