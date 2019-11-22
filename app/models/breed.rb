class Breed < ApplicationRecord
  belongs_to :parent, class_name: 'Breed', optional: true

  validates_presence_of :name
end
