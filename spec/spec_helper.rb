require 'i18n'
require 'i18n/backend/active_record'
require 'i18n/active_record/scoped'

I18n.backend = I18n::Backend::ActiveRecord.new

require 'pry-nav'
require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
load 'support/models.rb'

RSpec.configure do |config|
  config.mock_with :rspec

  config.before(:each) do
    ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
    load 'support/schema.rb'
    load 'support/seeds.rb'
  end
end
