require 'coveralls'
Coveralls.wear_merged!('rails')
require "webmock/rspec"
WebMock.enable!

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
  config.before do
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=80089a9e6edb5f524156c569cd8a9a69&query=Star%20wars")
      .to_return(status: 200, body: file_fixture("moviedb_search_movie_response.json").read, headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=80089a9e6edb5f524156c569cd8a9a69&query=sdrhiugreljreajipvbavrsipjiafewpiub")
      .to_return(status: 200, body: file_fixture("moviedb_search_movie_no_results.json").read, headers: {})
  end
  config.before(:each) do
    @stripe_test_helper = StripeMock.create_test_helper
    StripeMock.start
  end
  config.after(:each) do
    StripeMock.stop
  end
end