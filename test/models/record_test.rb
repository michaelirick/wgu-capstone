require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  %i[title animal].each do |attr|
    test "#{attr} is required" do
      record = Record.new
      record.save
      assert !record.errors.messages[attr].empty?
    end
  end
end
