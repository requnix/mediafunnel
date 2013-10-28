class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  has_many :subscriptions

  field :email
  field :password
  field :username
  field :password_digest

  has_secure_password

  validates :username, uniqueness: true

end
