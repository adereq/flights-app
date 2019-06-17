module ApplicationHelper
    def nav_items
    [ {
      url: "#", 
      title: 'Home'
    },
    {
      url: "#", 
      title: 'About'
    },
    {
      url: "#", 
      title: 'Contact'
    },
    {
      url: "#", 
      title: 'Blog'
    },
    {
      url: "#", 
      title: 'Portfolio'
    }
  ]
  end
  
  def nav_helper style, tag_type
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end
end
