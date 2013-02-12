# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe MassDeletable do
  
  before(:each) do
    @person = Person.create(:name => "John Doe")
    
    @siblings = []
    ["one", "two", "three", "four"].each do |entry|
      @siblings << Sibling.create(:name => entry, :person => @person)
    end
    
  end
  
  it "should mass destroys" do
    
    Sibling.mass_destroy(:bunch => @siblings).should be true
    
  end
  
  it "should raise an error if no bunch of data is given" do
    lambda{Sibling.mass_destroy}.should raise_error(MassDeletable::Errors::MassDeletableHashError, "No bunch of items to delete given!")
  end
  
  it "should raise an error if a wrong bunch of data is given" do
    bunch = ["a", "b", "c"]
    lambda{Sibling.mass_destroy(:bunch => bunch)}.should raise_error(MassDeletable::Errors::MassDeletableNotFixnumError, "Not support type of class!")
  end
  
end
