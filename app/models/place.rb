class Place
  include Mongoid::Document
  field :name_id, type: String
  field :name, type: String
  field :location_name, type: String
  field :description, type: String
  field :facebook_url, type: String
  field :email, type: String
  field :cellphone, type: String
  field :logo_path, type: String
  field :location_url, type: String
  field :video_url, type: String
  field :max_thumb_images, type: Integer
  field :max_slider_images, type: Integer

  has_many :rooms
  has_many :tours
  has_many :activities
  has_many :common_areas

end
