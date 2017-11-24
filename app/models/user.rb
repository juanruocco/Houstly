class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  before_save { self.email = email.downcase }

  field :email, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :password_digest, type: String
  field :birthdate, type: Date
  field :sex, type: String
  field :type_license, type: String
  field :expiration_date, type: Date

  has_many :places
  has_secure_password(validations: false)

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  

end
