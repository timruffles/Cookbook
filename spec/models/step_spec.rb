require 'spec_helper'

describe Step do
  
  before(:each) do
    @valid_attributes = {
      
    }
     @fixtures = YAML.load_file(File.dirname(__FILE__) + '/../data/steps.yml')
  end

  it "should create a new instance given valid attributes" do
    Step.create!(@valid_attributes)
  end
  
  it "should break a piece of text into multiple steps" do
    
    steps = Step.from_text(@fixtures['3_steps'])
    steps.length.should == 3
    
  end
  
  it "should cut urls out of the text and store them in url field" do
    
    one, two, three = Step.from_text(@fixtures['3_steps'])
    
    /http:\/\//.should_not match three.text
    /http:\/\//.should match three.url
  end
  
  it "should turn steps back into text for editing" do
    
    output = Step.to_text(Step.from_text(@fixtures['3_steps']))
    p output
    (['1.','2.','3.'].all? {|n| output.include? n}).should == true
    /http:\/\/google.com$/.should match output
    
  end
  
end
