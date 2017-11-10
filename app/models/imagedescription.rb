class Imagedescription
  include Mongoid::Document

  field :name, type: String
  field :description, type: String
  field :image_path, type: String

  belongs_to :webcomponent
end
