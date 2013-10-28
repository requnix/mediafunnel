xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Releases"
    xml.description "List of Releases"
    xml.link releases_url

    for release in @releases
      xml.item do
        xml.title release.releasable.identifier
        xml.group release.group
        xml.source release.source
        xml.resolution release.resolution
        xml.link release.magnet
        xml.pubDate release.created_at.to_formatted_s(:rfc822)
      end
    end
  end
end