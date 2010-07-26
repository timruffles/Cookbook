require 'spec_helper'

describe Recipe do
  
  
  fixtures :recipes, :steps, :users
  
  before(:each) do
    @valid_attributes = {
      :name         => 'Recipe one',
      :steps_as_text        => "1. Step one\n2. Step two"
    }
  end

  it "should create a new instance given valid attributes" do
    Recipe.create!(@valid_attributes)
  end
  
  it "should create related steps when passed" do
    a = Recipe.new(@valid_attributes)
    a.steps.length.should == 2
    (a.steps.all? {|s| Step === s}).should == true
  end
  
  it "should find todos with when a user is supplied" do
    
    sut = Recipe.with_todos_for(users('bill')).find(recipes(:cake).id)
    p sut
    p sut.steps
    
  end
  
  it "should should update by replacing steps with new ones" do
    
    recipe = Recipe.create(@valid_attributes)
    recipe.steps.length.should == 2
    recipe.update_attributes!({:steps_as_text => "1. one\n2. two\n3. three"})
    recipe.steps.length.should == 3
    recipe.steps[1].text.should == 'two'
  end
end
