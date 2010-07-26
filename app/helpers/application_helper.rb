# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def header title, tagline = nil
    render :partial => 'layouts/header', :locals => {:title => title, :tag_line => tagline}
  end
  
  def recent_records model, count
    clazz = model.to_s.classify.constantize
    records = clazz.all(:order => 'created_at DESC', :limit => count)
  end
  
  # returns an array of anchor tags, and yields each to a block if given
  def recent_links model, link_text_attribute, count = 5
    
    records = recent_records model, count
    
    if block_given? 
      records.each do |record|
        yield link_to record.send(link_text_attribute), record
      end
    else
      records.inject([]) do |output, record|
        output << link_to(record.send(link_text_attribute), record)
      end
    end
  end
  
  def random_links model, number_of_links
    
    clazz = model.to_s.classify.constantize
    records = random_records clazz, number_of_links
    
    output = ''
    records.each do |record|
      output += "<li>#{link_for record}</li>"
    end
    
    output
  end
  
  def random_records clazz, limit = 5
    # FIXME - has two probs - 0 id for some reason, and a prob with the alogorithm if using non-sequential or
    # often deleted records, with gaps
    max = clazz.find_by_sql("SELECT MAX(id) FROM #{clazz.name.tableize} LIMIT #{limit * 5}")[0]['MAX(id)'].to_i
    randoms = []
    
    1..(limit * 5).times do
      randoms << rand(max)
    end
    
    clazz.all(:conditions => {:id => randoms}, :limit => limit)
    
  end
  
end