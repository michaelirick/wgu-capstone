class CypressTest < CypressRails::TestCase
  Rails.logger = Logger.new(STDOUT)
  test_locator "cypress/integration/*.js"
end
