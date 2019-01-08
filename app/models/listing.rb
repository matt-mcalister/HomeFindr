class Listing < ApplicationRecord

  attr_writer :response, :parsed_page
  after_save
  @@options = {
    headers: {
      accept: "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
      "accept-encoding": "gzip, deflate, br",
      "accept-language": "en-US,en;q=0.9,en-GB;q=0.8",
      "cache-control": "no-cache",
      cookie: ,
      pragma: "no-cache",
      "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"
    }
  }

def initialize(url)
  @url = url
  @source = url.split(".com").first.split("://").last.split("www.").first
end

  def assign_source

  end

def fetch_data
  self.response = HTTParty.get(self.url, @@options)
end

def response
  @response || self.fetch_data
end

def json
  JSON.parse(self.response.body)
end

def parsed_page
  @parsed_page || self.parsed_page = Nokogiri::HTML(self.response)
end
end
