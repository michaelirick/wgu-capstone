class Record < ApplicationRecord
  belongs_to :animal

  has_one_attached :image

  TYPES = %i[
    pedigree
    vaccination
    miscellaneous
  ]
end
