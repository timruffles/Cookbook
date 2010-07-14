class Recipe < ActiveRecord::Base
  belongs_to :chef
  
  
  def each_step
    part_no = 0
    steps.split(/^\d+\./).each do |part|
      next if part =~ /^[\s\t\r]*$/
      part_no += 1
      yield make_links(part), part_no
    end
  end
  
  def make_links part
    part.gsub(/(http:\/\/\S*)/,'<a href="\1">Click here</a>')
  end
  
end
