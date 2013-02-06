class Comment < ActiveRecord::Base
  attr_accessible :article, :author, :body

  validates :author, :body, presence: true

  belongs_to :article
end
