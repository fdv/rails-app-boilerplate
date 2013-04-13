module ApplicationHelper
  def page_header(title, tag='h1')
    content_tag(:div, :class => 'page-header') do
      content_tag(tag.to_sym, title)
    end    
  end
  
end
