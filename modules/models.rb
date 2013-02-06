require 'date'

module PublishData
  def self.included(caller)
    # puts "#{caller} is including #{self}"
    caller.extend ClassMethods
  end

  def title
    @title || self.class.to_s
  end

  def author
    @author || "Ms. #{self.class}"
  end

  module ClassMethods
    def find_by_title(title)
      puts "Database searching for #{self} title #{title}"
      self.new
    end
  end
end

module Finders
  def self.extended(caller)
    # puts "#{caller} is extending #{self}"
  end

  def find(index)
    puts "Database is searching for #{self} #{index}"
    self.new
  end
end

class Article

  def self.find(number)
    puts "Article #{number}"
    self.new
  end

  def title
    "I am the original title"
  end

  include PublishData
  extend Finders

  def method_missing(name,*args)
    # puts "I tried to call #{name} with #{args}"

    if name.to_s.end_with? "date"

      self.class.send :define_method, name do
        DateTime.now
      end

    else
      super name, *args
    end
  end

end

class Gallery
  include PublishData
  extend Finders
end

article = Article.find(1)
# article = Article.find_by_title("Four Seasons")
# gallery = Gallery.find(1)

puts "#{article.title} by #{article.author} on #{article.publish_date}"
# puts "#{gallery.title} by #{gallery.author}"