require 'active_record'
require 'sqlite3'
require 'yaml'
require_relative '../app/models/maraton_model'
require_relative '../app/controllers/maraton_controller'
require_relative '../app/views/maraton_view'

configuration = YAML::load_file(File.join(__dir__, 'database.yml'))
ActiveRecord::Base.establish_connection(configuration['development'])
