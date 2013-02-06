require "csv"
require "erb"

require "legislators"
require_relative "zipcode"


# require File.join "./", File.dirname(__FILE__), "zipcode"
# require "./#{File.dirname(__FILE__)}/zipcode"

puts "EventManager Initialized with parameters #{ARGV.inspect}"

default_file_name = "event_attendees.csv"

filename = ARGV.first || default_file_name

if not File.exist? filename
  warn "No file found: #{filename}"
  exit 1
end

contents = CSV.open filename, headers: true, header_converters: :symbol

form_letter = File.read "form_letter.html.erb"
form_letter_erb = ERB.new form_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = Zipcode.new row[:zipcode]

  legislators = Legislators.for_zipcode(zipcode)
  personal_letter = form_letter_erb.result(binding)

  puts "#{name} #{zipcode} #{legislators.length}"

  # Dir.mkdir("thank_you") unless Dir.exist? "thank_you"
  # File.write "thank_you/#{id}.html", personal_letter
end