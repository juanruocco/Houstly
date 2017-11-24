class Link
  include Mongoid::Document

  field :name, type: String
  field :description, type: String
  field :url, type: String

  belongs_to :webcomponent

end
