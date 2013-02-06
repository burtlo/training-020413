class Snot

end



module Elephant

  module Trunk
    module NoseHair
      class Snot

      end

      class Booger < Snot

      end

      Snot
      ::Snot
    end

    NoseHair::Snot
  end

  def element(field,value)
    define_method field do
      value.to_s
    end

    define_method "#{field}=" do |new_value|
      value = new_value
    end
  end

  Trunk::NoseHair::Snot
end

Elephant::Trunk::NoseHair::Snot
Elephant::Trunk::NoseHair::Booger

class Article
  extend Elephant

  element "title", "Frank's Memoirs"
  element "author", "Frank Webber"
end


article = Article.new
puts article.title
article.title = "Jeremy's Memoirs"
puts article.title