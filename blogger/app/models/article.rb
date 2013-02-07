class Article < ActiveRecord::Base
  attr_accessible :title, :body, :image

  validates :title, :body, presence: true

  has_many :comments
  has_attached_file :image, styles: { 
    thumbnail: "100x100>",
    medium: "300x300>" }

end
