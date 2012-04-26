xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Headlines"
    xml.description "Wing Commander: New Horizon - In-Character Headlines"
    xml.link headlines_url(:rss)
    
    for story in @headlines
      xml.item do
        xml.title story.title
        xml.description story.body
        xml.pubDate story.created_at.to_s(:rfc822)
        xml.link headlines_url(story, :rss)
        xml.guid headlines_url(story, :rss)
      end
    end
  end
end