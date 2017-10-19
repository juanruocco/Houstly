class Place
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :picture, type: String
  field :video_url, type: String

  has_many :rooms
  has_many :tours
end
