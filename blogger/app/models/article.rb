class Article < ActiveRecord::Base
  attr_accessible :title, :body

  validates :title, :body, presence: true

  has_many :comments
end
