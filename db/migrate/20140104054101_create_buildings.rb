class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :street_address
      t.string :city
      t.integer :state_id
      t.string :postal_code
      t.text :description
      t.integer :owner_id

      t.timestamps
    end
  end
end
