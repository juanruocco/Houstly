class User
  include Mongoid::Document
  field :email, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :password, type: String
  field :birthdate, type: Date
  field :sex, type: String
  field :type_license, type: String
  field :expiration_date, type: Date

  has_many :places
end
