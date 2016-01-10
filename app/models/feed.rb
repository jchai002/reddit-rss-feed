class Feed < ActiveRecord::Base
  require 'open-uri'
  validates :query, presence: true, uniqueness: true

  def get_articles
    articles = []
    feed_url = "https://www.reddit.com/r/#{self.query}/.rss"

    begin
      doc = Nokogiri::XML(open(feed_url))
    rescue
      doc = nil
    end

    if doc
      doc.css('item').each_with_index do |node, idx|
        item = {
          id: idx,
          title: node.css('title').children.text,
          link:node.css('link').children.text,
          date:node.css('pubDate').children.text
        }
        articles.push(item)
      end
    end
    return articles
  end


end
