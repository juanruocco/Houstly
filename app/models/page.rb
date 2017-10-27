class Page
  include Mongoid::Document

  field :name_id, type: String
  field :name, type: String

  has_many :components
end
