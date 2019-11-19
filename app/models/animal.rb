class Animal < ApplicationRecord
  belongs_to :sire, optional: true
  belongs_to :dam, optional: true
  belongs_to :breed
  has_many :progeny_by, foreign_key: :sire_id
  has_many :progeny_from, foreign_key: :dam_id

  validates sex: :presence

  SEXES = %i[male female].freeze

  SEXES.each do |sex|
    define_method :"#{sex}?" do
      sex.to_sym == sex
    end
  end
end
