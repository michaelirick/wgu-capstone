class Breed < ApplicationRecord
  belongs_to :parent, class_name: 'Breed', optional: true
end
