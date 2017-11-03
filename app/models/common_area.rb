class CommonArea
  include Mongoid::Document

  field :title, type: String
  field :description, type: String
  field :image_path, type: String

  belongs_to :place
  
end
