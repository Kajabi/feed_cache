module FeedCache
  DEFAULT_ENTRIES_LIMIT = 10
  DEFAULT_EXPIRES_IN = 900

  class << self
    attr_accessor :cache
    attr_writer :default_entries_limit, :default_expires_in

    def default_entries_limit
      @default_entries_limit || DEFAULT_ENTRIES_LIMIT
    end

    def default_expires_in
      @default_expires_in || DEFAULT_EXPIRES_IN
    end

    def configure(&block)
      yield self
    end
    alias_method :config, :configure
  end

  def self.fetch(url, options = {})
    feed = FeedCache::Fetcher.new(url, options)
    feed.fetch
    feed.valid_feed? ? feed : nil
  end

  def self.entries_for(url, options = {})
    limit = options.delete(:limit) || default_entries_limit
    feed = fetch(url, options)
    (feed ? feed.entries : []).slice(0, limit)
  end
end

require File.expand_path("feed_cache/fetcher", File.dirname(__FILE__))
require File.expand_path("feed_cache/version", File.dirname(__FILE__))
