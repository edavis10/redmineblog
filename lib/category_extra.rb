# Duplicate of Tagging

module CategoryExtra

  require 'set'

  #Return true if an items has a specified category
  def has_category?(item, category)
    return false if item[:categories].nil?
    item[:categories].collect{|c| c.downcase}.include? category.downcase
  end

  #Finds all the items having a specified category.
  #By default the method search in all the site
  #items. Alternatively, an item collection can
  #be passed as second (optional) parameter, to
  #restrict the search in the collection.
  def items_with_category(category, items=nil)
    items = @items if items.nil?
    items.select { |item| has_category?( item, category ) }
  end

  def link_to_category(category)
    "<a href='/categories/#{category.downcase}/' title='#{category}'>#{category}</a>"
  end
end

include CategoryExtra
