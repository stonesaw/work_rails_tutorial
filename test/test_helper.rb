ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Add more helper methods to be used by all tests here...
  def login_as_dave
    post "/login", params: { name: "dave", password: "secret" }
  end

  def logout
    session.delete :user_id
  end

  def setup
    login_as_dave
  end
end
