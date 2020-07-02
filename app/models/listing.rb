class Listing < ApplicationRecord
  has_and_belongs_to_many :manufacturers
  has_and_belongs_to_many :conditions
  has_and_belongs_to_many :hulls
  has_and_belongs_to_many :kind_of_boats
  has_and_belongs_to_many :materials
  has_and_belongs_to_many :riggings
  has_and_belongs_to_many :states
  has_one_attached :thumbnail
  has_many_attached :images
  has_rich_text :description
  acts_as_votable

  def resized_thumbnail
    thumbnail.variant(resize: "240x135!")
  end

  def manyimage input
    return self.images[input].variant(resize: '350x250!').processed
  end
end
