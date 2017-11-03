class Tour
  include Mongoid::Document

  field :name_id, type: String
  field :title, type: String
  field :description, type: String
  field :image_path, type: String

  belongs_to :place
  
end
