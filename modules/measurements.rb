module Measurement
  def dozen
    self * 12
  end
end


class Float
  include Measurement
end

class Fixnum
  include Measurement
end

puts 1.dozen
puts 1.2.dozen