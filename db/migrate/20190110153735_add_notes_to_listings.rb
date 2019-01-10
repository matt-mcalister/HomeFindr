class AddNotesToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :notes, :string
  end
end
