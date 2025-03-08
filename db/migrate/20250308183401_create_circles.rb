class CreateCircles < ActiveRecord::Migration[6.0]
  def change
    create_table :circles do |t|
      t.string :name
      t.string :acronym
      t.bigint :parent_id

      t.timestamps
    end
  end
end
