require 'spec_helper'

describe Step do
  
  @fixtures = YAML.load_file(File.dirname(__FILE__) + '/../data/steps.yml')
  
  before(:each) do
    @valid_attributes = {
      
    }
    
  end

  it "should create a new instance given valid attributes" do
    Step.create!(@valid_attributes)
  end
  
  it "should break a piece of text into multiple steps" do
    
    steps = Step.parse(@fixtures['3_steps'])
    steps.length.should == 3
    
  end
end
