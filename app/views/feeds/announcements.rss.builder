xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "WCNH Announcements"
    xml.description "Wing Commander: New Horizon - Game Announcements"
    xml.link headlines_url(:rss)
    
    for post in @announcements
      xml.item do
        xml.title post.title
        xml.description post.body.gsub("\n", "<br>").html_safe
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link url_for :controller => 'feeds', :action => 'show', :id => post.id
        xml.guid url_for :controller => 'feeds', :action => 'show', :id => post.id
      end
    end
  end
end
