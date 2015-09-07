# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'carrierwave'
require 'carrierwave/orm/activerecord'
config.load_paths << "#{Rails.root}/app/uploaders"
config.autoload_paths += %W(#{config.root}/lib #{config.root}/app/uploaders)
# Initialize the Rails application.
Rails.application.initialize!
