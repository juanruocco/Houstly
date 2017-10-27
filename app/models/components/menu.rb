class Menu
  include Mongoid::Document
  field :logo, type: String

  has_many :components
end
