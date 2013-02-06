require 'erb'

meaning_of_life = 42

question = "The Answer to the Ultimate Question of Life, the Universe, and Everything is <% result = meaning_of_life %> <%= result %>"
template = ERB.new question

puts template.result(binding)

meaning_of_life = 84
puts template.result(binding)