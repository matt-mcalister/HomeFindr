class Listing < ApplicationRecord
  belongs_to :hunt

  # def hunt_id=(arg)
  #   if arg == "Create New Hunt"
  #     hunt = Hunt.create(name: "My New Hunt")
  #     self.update(hunt_id: hunt.id)
  #   else
  #     self.update(hunt_id: arg)
  #   end
  # end

  def formatted_address
    "#{self.street_address}, #{self.city}, #{self.state} #{self.zip_code}"
  end

  def to_json
    {
      id: self.id,
      street_address: self.street_address,
      city: self.city,
      state: self.state,
      zip_code: self.zip_code,
      neighborhood: self.neighborhood,
      price: self.price,
      num_beds: self.num_beds,
      num_bath: self.num_bath,
      no_fee: self.no_fee,
      dishwasher: self.dishwasher,
      guarantors_accepted: self.guarantors_accepted,
      outdoor_space: self.outdoor_space,
      laundry_in_unit: self.laundry_in_unit,
      laundry_in_building: self.laundry_in_building,
      doorman: self.doorman,
      package_handling: self.package_handling,
      elevator: self.elevator,
      gym: self.gym,
      url: self.url,
      notes: self.notes,
      hunt: {
        id: self.hunt.id,
        name: self.hunt.name
      }
    }
  end

end
