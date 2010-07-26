require 'spec_helper'

describe ApplicationHelper do
  
  it "should retrieve recent records" do
    
    records = helper.recent_records Recipe, 3
    
    records.length.should == 3
    (records.all? {|r| Recipe === r}).should == true
    
  end
  it "should generate recent links on request" do
    output = helper.recent_links :recipe, :name, 3
    
    (output.all? {|l| /<a href=/ =~ l}).should == true
    
  end
  
  
  # it "should retrieve random records" do
  #   
  #   records = helper.random_records Recipe, 3
  #   
  #   records.length.should == 3
  #   (records.all? {|r| Recipe === r}).should == true
  #   
  # end
  # it "should generate random links on request" do
  #   output = helper.random_links :recipe, 3
  #   
  #   output.scan(/<li>/).length.should == 3
  # end

end
