class Webcomponent
  include Mongoid::Document

  field :name, type: String
  field :description, type: String
  field :style, type: String

  has_many :imagedescriptions
  belongs_to :place


end
