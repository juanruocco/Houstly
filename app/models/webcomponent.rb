class Webcomponent
  include Mongoid::Document

  field :name, type: String
  field :description, type: String
  field :style, type: String

  has_many :imagedescriptions
  has_many :links

  belongs_to :place


end
