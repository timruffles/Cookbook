require 'spec_helper'

describe Recipe do
  before(:each) do
    @valid_attributes = {
      :name         => 'Recipe one',
      :steps        => "1. Step one\n2. Step two"
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
    
    sut = Recipe.find_with_todos(recipes(:cake).id)
    p sut
    p sut.steps
    
  end
end
