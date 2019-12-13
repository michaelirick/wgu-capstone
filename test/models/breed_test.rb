require 'test_helper'

class BreedTest < ActiveSupport::TestCase
  %i[name].each do |attr|
    test "#{attr} is required" do
      breed = Breed.new
      breed.save
      assert !breed.errors.messages[attr].empty?
    end
  end
end
