class CreateHunts < ActiveRecord::Migration[5.2]
  def change
    create_table :hunts do |t|
      t.string :name

      t.timestamps
    end
  end
end
