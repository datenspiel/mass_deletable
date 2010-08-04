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
      opt[:bunch].each do |item|
        if(item.kind_of?(ActiveRecord::Base))
          single_out_id = item.send(:id)
        else
          raise MassDeletable::Errors::MassDeletableNotFixnumError, "Not support type of class!" unless item.kind_of?(Fixnum)
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
