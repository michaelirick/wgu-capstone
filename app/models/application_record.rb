# app/models/application_record.rb
# the presence of this file prevents rails migrations from recreating application_record.rb
# see https://github.com/rails/rails/issues/29407

# BH - I am not sure this is right
# require 'models/application_record.rb'
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  regulate_scope all: true
end if Rails.env.production?
