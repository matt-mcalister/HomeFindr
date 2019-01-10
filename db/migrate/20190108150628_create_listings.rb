class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :neighborhood
      t.integer :price
      t.integer :num_beds
      t.integer :num_bath
      t.boolean :no_fee
      t.boolean :dishwasher
      t.boolean :guarantors_accepted
      t.boolean :outdoor_space
      t.boolean :laundry_in_unit
      t.boolean :laundry_in_building
      t.boolean :doorman
      t.boolean :package_handling
      t.boolean :elevator
      t.boolean :gym
      t.string :url


      t.timestamps
    end
  end
end
