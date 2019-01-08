class Listing < ApplicationRecord

  attr_writer :response, :parsed_page
  after_create :assign_source
  @@options = {
    headers: {
      accept: "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
      "accept-encoding": "gzip, deflate, br",
      "accept-language": "en-US,en;q=0.9,en-GB;q=0.8",
      "cache-control": "no-cache",
      cookie: ENV["COOKIE"],
      pragma: "no-cache",
      "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"
    }
  }

  def assign_source
    self.source = url.split(".com").first.split("://").last.split("www.").first
    self.save
  end

  def fetch_data
    self.response = HTTParty.get(self.url, @@options)
  end

  def response
    @response || self.fetch_data
  end

  def parsed_page
    @parsed_page || self.parsed_page = Nokogiri::HTML(self.response)
  end

  def assign_values
    case self.source
    when "streeteasy"
      self.streeteasy_values
    else
      puts "**************************************************"
      puts "Could Not Assign Values, No Valid Source Indicated"
      puts "**************************************************"
    end
  end

  def streeteasy_values
    self.street_address_one = parsed_page.css("a.incognito").first.text
    self.city = parsed_page.css("div.backend_data.BuildingInfo-item > span.Text").first.text.gsub(/\n|,/,"").split(" ")[0]
    self.state = parsed_page.css("div.backend_data.BuildingInfo-item > span.Text").first.text.gsub(/\n|,/,"").split(" ")[1]
    self.zip_code = parsed_page.css("div.backend_data.BuildingInfo-item > span.Text").first.text.gsub(/\n|,/,"").split(" ")[-1].to_i
    self.price = parsed_page.css("div.price").first.children[2].text.gsub(/\ |\n|\$|\,/, "").to_i
    self.no_fee = !parsed_page.css("div.status.nofee").empty?
    self.num_beds = parsed_page.css("span.detail_cell").find {|el| el.text.include?("bed")}.text.split(" ").first.to_i
    self.num_bath = parsed_page.css("span.detail_cell").find {|el| el.text.include?("bath")}.text.split(" ").first.to_i
    self.description = parsed_page.css("div.Description-block.jsDescriptionExpanded").inner_html
    self.neighborhood = parsed_page.css("span.Text").find {|el| el.text.include?("Rental Building in ")}.children.find {|el| el.name == "a"}.text
    self.save
  end
end
