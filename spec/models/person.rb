# -*- encoding : utf-8 -*-
class Person < ActiveRecord::Base
  
  set_table_name "persons"
  
  has_many :siblings 
  
end
