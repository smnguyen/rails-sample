# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# https://stackoverflow.com/a/27960641
require 'carrierwave/orm/activerecord'
