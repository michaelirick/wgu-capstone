require 'test_helper'

class AnimalTest < ActiveSupport::TestCase
  %i[name sex breed].each do |attr|
    test "#{attr} is required" do
      animal = Animal.new
      animal.save
      assert !animal.errors.messages[attr].empty?
    end
  end
end
