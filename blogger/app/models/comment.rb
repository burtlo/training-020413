class Comment < ActiveRecord::Base
  attr_accessible :article, :author, :body

  belongs_to :article
end
