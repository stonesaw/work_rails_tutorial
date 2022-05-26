# 統合テストテストでは全てのフィクスチャを読み込みたくないが
# ユニットテスト・コントローラーのテストでは読み込んでほしいので
# fixtures :all をコメントアウトしたこのファイルを作成

# require "test_helper" -> require_relative "./../integration_test_helper"


ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end
