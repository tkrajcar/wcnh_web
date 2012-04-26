xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "WCNH Global Emits"
    xml.description "Wing Commander: New Horizon - Global Emits"
    xml.link gmemits_url(:rss)
    
    for emit in @gmemits
      xml.item do
        xml.title emit.created_at.strftime("%b %e %Y %H:%M %Z")
        xml.description emit.body.encode("ASCII").gsub(/\x02\S*\x03/,'')
        xml.pubDate emit.created_at.to_s(:rfc822)
        xml.link url_for :controller => 'feeds', :action => 'show', :id => emit.id
        xml.guid url_for :controller => 'feeds', :action => 'show', :id => emit.id
      end
    end
  end
end