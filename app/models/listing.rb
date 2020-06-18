class Listing < ApplicationRecord
  has_and_belongs_to_many :manufacturers
  has_and_belongs_to_many :conditions
  has_and_belongs_to_many :hulls
  has_and_belongs_to_many :kind_of_boats
  has_and_belongs_to_many :materials
  has_and_belongs_to_many :riggings
  has_and_belongs_to_many :states
  has_one_attached :thumbnail

  def resized_thumbnail
    thumbnail.variant(resize: "240x135!")
  end
end
