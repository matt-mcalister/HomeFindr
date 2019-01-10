class AddHuntIdToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :hunt_id, :integer
  end
end
