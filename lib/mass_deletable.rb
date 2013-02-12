# -*- encoding : utf-8 -*-
module MassDeletable
  
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module Errors
    
    class MassDeletableHashError < StandardError; end
    
    class MassDeletableNotFixnumError < StandardError; end
  end
  
  module ClassMethods
    
    def mass_destroy(opt={})
      raise MassDeletable::Errors::MassDeletableHashError, "No bunch of items to delete given!" if opt.empty? 
      destroyed = true
      if opt[:bunch].is_a?(String) and opt[:bunch].include?(",")
        bunches = opt[:bunch].split(",")
        bunches.each_with_index do |id,index|
          bunches[index] = id.to_i
        end
        opt[:bunch] = bunches
      elsif opt[:bunch].is_a?(String)
        opt[:bunch] = [opt[:bunch].to_i]
      end
      opt[:bunch].each do |item|
        if(item.kind_of?(ActiveRecord::Base))
          single_out_id = item.send(:id)
        else
          unless item.kind_of?(Fixnum)
            item = item.to_i
          end
          single_out_id = item
        end
        unless self.find(single_out_id).destroy
          destroyed = false
          break
        end
      end
      return destroyed
    end
  end
  
  
end
