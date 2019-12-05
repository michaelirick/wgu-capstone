class Record < ApplicationRecord
  belongs_to :animal

  has_one_attached :image unless RUBY_ENGINE == 'opal'

  server_method :image_file do
    unless image.attachment.nil?
      Rails.application.routes.url_helpers.rails_blob_path(
        image.attachment, disposition: "attachment", only_path: true
      )
    end
  end

  validates_presence_of :title

  TYPES = %i[
    pedigree
    vaccination
    miscellaneous
  ]
end
