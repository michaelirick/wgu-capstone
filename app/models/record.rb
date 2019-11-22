class Record < ApplicationRecord
  belongs_to :animal

  has_one_attached :image
  validates_presence_of :title

  TYPES = %i[
    pedigree
    vaccination
    miscellaneous
  ]
end
