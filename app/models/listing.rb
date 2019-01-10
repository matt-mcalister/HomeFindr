class Listing < ApplicationRecord

  attr_writer :response, :parsed_page
  after_create :assign_source

  # FORMATTING
  def formatted_address
    "#{self.street_address_one}, #{self.city}, #{self.state} #{self.zip_code}"
  end

end
