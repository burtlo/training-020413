require "legislators/version"
require "sunlight"

module Legislators

  def self.setup_sunlight
    puts "Setting up Sunlight"
    Sunlight::Base.api_key = "e179a6973728c4dd3fb1204283aaccb5"
    @setup_compelete = true
  end

  def self.setup_complete?
    @setup_compelete
  end

  def self.for_zipcode(zipcode)
    setup_sunlight unless setup_complete?
    Sunlight::Legislator.all_in_zipcode(zipcode)
  end

end
