class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :url
      t.string :street_address_one
      t.string :street_address_two
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :price
      t.boolean :no_fee
      t.integer :num_beds
      t.float :num_bath
      t.boolean :laundry_in_unit
      t.boolean :laundry_in_building
      t.boolean :central_air
      t.text :description
      t.boolean :has_dishwasher
      t.string :neighborhood
      t.boolean :package_handling
      t.boolean :guarantors_accepted
      t.string :source

      t.timestamps
    end
  end
end
