class Animal < ApplicationRecord
  belongs_to :sire, optional: true, class_name: 'Animal'
  belongs_to :dam, optional: true, class_name: 'Animal'
  belongs_to :breed
  has_many :progeny_by, foreign_key: :sire_id, class_name: 'Animal'
  has_many :progeny_from, foreign_key: :dam_id, class_name: 'Animal'
  has_many :records
  unless RUBY_ENGINE == 'opal'
    has_many_attached :images
    has_one_attached :profile_image
  end

  server_method :image_files do
    unless images.nil?
      images.attachments.map do |image|
        Rails.application.routes.url_helpers.rails_blob_path(
          image, disposition: "attachment", only_path: true
        )
      end
    else
      []
    end
  end

  server_method :profile_image_file do
    unless profile_image.attachment.nil?
      Rails.application.routes.url_helpers.rails_blob_path(
        profile_image.attachment, disposition: "attachment", only_path: true
      )
    else
      ''
    end
  end

  scope :with_breed, ->(b) { where breed: b }
  scope :filter, ->(data) { where data }

  validates_presence_of :sex
  validates_presence_of :name

  SEXES = %i[male female].freeze

  SEXES.each do |sex|
    define_method :"#{sex}?" do
      self.sex.to_sym == sex
    end

    scope :"#{sex.to_s.pluralize}", -> { where sex: sex }
  end
end
