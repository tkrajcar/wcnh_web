xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "WCNH Headlines"
    xml.description "Wing Commander: New Horizon - Headlines"
    xml.link headlines_url(:rss)
    
    for story in @headlines
      xml.item do
        xml.title story.title
        xml.description story.body.gsub("\n", "<br>").html_safe
        xml.pubDate story.created_at.to_s(:rfc822)
        xml.link url_for :controller => 'feeds', :action => 'show', :id => story.id
        xml.guid url_for :controller => 'feeds', :action => 'show', :id => story.id
      end
    end
  end
end
