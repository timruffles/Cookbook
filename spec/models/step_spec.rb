require 'spec_helper'

describe Step do
  
  fixtures :users, :steps, :recipes, :todos
  
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
    (['1.','2.','3.'].all? {|n| output.include? n}).should == true
    /http:\/\/google.com$/.should match output
    
  end
  
  it "should correctly cut out urls" do
    
    steps = <<-STEPS
    1. Socrates on self-confidence http://video.google.com/videoplay?docid=-2808374571100926940# 
    2. Business Implications of http://www.bola.biz/ethics/socrates.html Socrates' philosophy 
    3. http://www.ibtimes.com/contents/20100618/seven-pieces-wisdom-socrates.htm 7 Pieces of Wisdom from Socrates 
    STEPS
    
    start, mid, at_end = Step.from_text(steps)
    start.url.should == 'http://video.google.com/videoplay?docid=-2808374571100926940#'
    mid.url.should == 'http://www.bola.biz/ethics/socrates.html'
    at_end.url.should == 'http://www.ibtimes.com/contents/20100618/seven-pieces-wisdom-socrates.htm'
    
    
  end
  
  it "should accept and check todos" do
    
    
    step = Step.create :todos_attributes => [{:completed_date => 1}]
    
    step.todos.last.completed_date.should_not == nil
  
  end
  
  it "should find steps with todos" do
    
    step = Step.with_todos_for(users(:jane)).find(steps(:add_mix))
    
    p step.todos
    
    
  end
  
end
