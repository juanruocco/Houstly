class Place
  include Mongoid::Document
  field :name_id, type: String
  field :name, type: String
  field :location_name, type: String
  field :description, type: String
  field :facebook_url, type: String 	#master
  field :email, type: String		#master
  field :cellphone, type: String	#master
  field :logo_path, type: String	#master
  field :location_url, type: String	#master
  field :video_url, type: String
  field :reservar_url, type: String	#master
  field :music_path, type: String	#master
  field :max_thumb_images, type: Integer
  field :max_slider_images, type: Integer

  field :direction, type: String	#master
  field :telephone, type: String	#master
  belongs_to :user

  has_many :webcomponents #master
end
