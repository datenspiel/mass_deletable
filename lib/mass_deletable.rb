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
      bunch = opt[:bunch]

      destroyed = true
      if bunch.is_a?(String) and bunch.include?(",")
        bunches = bunch.split(",")
        bunches.each_with_index do |id,index|
          bunches[index] = id.to_i
        end
        bunch = bunches
      elsif bunch.is_a?(String)
        bunch = [bunch.to_i]
      end
      self.destroy(bunch)
      return destroyed
    end
  end


end
