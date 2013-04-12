module ApplicationHelper
  def page_header(title)
    content_tag(:div, :class => 'page-header') do
      content_tag(:h1, title)
    end    
  end
  
end
