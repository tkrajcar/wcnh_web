xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "WCNH Contracts"
    xml.description "Wing Commander: New Horizon - Procurement Contracts"
    xml.link headlines_url(:rss)
    
    for contract in @contracts
      xml.item do
        xml.title contract.title
        xml.description contract.body.gsub("\n", "<br>").html_safe
        xml.pubDate contract.created_at.to_s(:rfc822)
        xml.link url_for :controller => 'feeds', :action => 'show', :id => contract.id
        xml.guid url_for :controller => 'feeds', :action => 'show', :id => contract.id
      end
    end
  end
end
