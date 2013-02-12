# -*- encoding : utf-8 -*-
require File.join(File.dirname(__FILE__), "lib", "mass_deletable")

ActiveRecord::Base.send(:include, MassDeletable)
