class FeedEntry < ActiveRecord::Base
  attr_accessible :guid, :name, :published_at, :summary, :url

  validates :name, :presence => true
  validates :guid, :uniqueness => true
  validates :url, :presence => true ,:url => true

  def self.update_from_feed(feed_url)  
	feed = Feedzirra::Feed.fetch_and_parse(feed_url)  
	feed.entries.each do |entry|  
	  unless exists? :guid => entry.id  
	    create!(  
	      :name         => entry.title,  
	      :summary      => entry.summary,  
	      :url          => entry.url,  
	      :published_at => entry.published,  
	      :guid         => entry.id  
	    )  
	    end  
	end  
  end  
  
end
