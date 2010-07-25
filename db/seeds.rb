# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
guru = Recipe.create(:name => 'Becoming a social media guru')
guru.steps = [
  Step.create(:text => 'Make a twitter account'),
  Step.create(:text => 'Think of a tweet'),
  Step.create(:text => 'Tweet it'),  
  Step.create(:text => 'Repeat'),  
]
doug = Factory.create(:chef, :name => 'Doug Richards', :tag_line => 'Social media gury', :profile_img => 'images/no-profile.png')
doug.recipes = [guru]
