#
# amount_of_padding = 5 - zipcode.length
# amount_of_padding.times { zipcode = "0#{zipcode}" }
#
# until zipcode.length == 5
#   zipcode = "0#{zipcode}"
# end
#
# zipcode = "%05d" % zipcode
#
# "00000#{zipcode}"[-5,5]
#
class Zipcode

  def default_unknown_zipcode
    "99999"
  end

  def initialize(raw)
    @raw = raw || default_unknown_zipcode
  end

  def to_s
    clean(@raw)
  end

  def clean(zipcode)
    zipcode.to_s.rjust(5,"0")[0,5]
  end
end