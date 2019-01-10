class Listing < ApplicationRecord
  belongs_to :hunt

  # FORMATTING
  def formatted_address
    "#{self.street_address}, #{self.city}, #{self.state} #{self.zip_code}"
  end

end
