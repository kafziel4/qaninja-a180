require_relative "routes/sessions"
require_relative "routes/signup"
require_relative "routes/equipo"
require_relative "helpers"
require_relative "libs/mongo"

require "digest/md5"

def to_md5(password)
  return Digest::MD5.hexdigest(password)
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:suite) do
    users = [
      {name: "Anna", email: "anna@gmail.com", password: to_md5("pwd123")},
      {name: "Bruna", email: "bruna@gmail.com", password: to_md5("pwd123")},
      {name: "Camila", email: "camila@gmail.com", password: to_md5("pwd123")},
      {name: "Diana", email: "diana@gmail.com", password: to_md5("pwd123")},
      {name: "Erica", email: "erica@gmail.com", password: to_md5("pwd123")},
      {name: "Fernanda", email: "fernanda@gmail.com", password: to_md5("pwd123")},
      {name: "Gabriela", email: "gabriela@gmail.com", password: to_md5("pwd123")},
    ]

    MongoDB.new.drop_danger
    MongoDB.new.insert_users(users)
  end
end
