# -*- encoding : utf-8 -*-
begin
  require File.dirname(__FILE__) + '/../../../../spec/spec_helper'
rescue LoadError
  puts "You need to install rspec in your base app"
  exit
end

plugin_spec_dir = File.dirname(__FILE__)
ActiveRecord::Base.logger = Logger.new(plugin_spec_dir + "/debug.log")

# load test schema
load(plugin_spec_dir + "/schema.rb")

# load test models
require File.join(plugin_spec_dir, 'models/person')
require File.join(plugin_spec_dir, 'models/sibling')
