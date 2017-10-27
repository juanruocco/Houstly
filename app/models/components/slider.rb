class Slider
  include Mongoid::Document
  field :name, type: String

  has_many :components
end
