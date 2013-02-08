class Author < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  validates_confirmation_of :password,
    message: "should match confirmation", if: :password

  validates :password, presence: true,
    length: { minimum: 4 }
end
