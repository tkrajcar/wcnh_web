xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "WCNH Global Emits"
    xml.description "Wing Commander: New Horizon - Global Emits"
    xml.link gmemits_url(:rss)
    
    for emit in @gmemits
      xml.item do
        xml.title emit.title
        xml.description emit.body.encode("ASCII").gsub(/\x02\D*\x03/,'')
        xml.pubDate emit.created_at.to_s(:rfc822)
      end
    end
  end
end