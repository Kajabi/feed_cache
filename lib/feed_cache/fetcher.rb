require 'feedzirra'

module FeedCache
  class Fetcher
    DEFAULT_EXPIRES_IN = 900

    extend Forwardable

    attr_reader :url, :options

    def_delegators :@fz_feed, :title, :last_modified, :entries

    def cache
      FeedCache.cache
    end

    def initialize(url, options = {})
      raise "cache must be set with FeedCache.cache=" unless cache
      @url = url
      @options = { :expires_in => FeedCache.default_expires_in }.merge options
    end

    def fetch
      @fz_feed = cache.fetch(cache_key, options) do
        Feedzirra::Feed.fetch_and_parse(url)
      end
    end

    def valid_feed?
      # Feedzirra returns fixnums in error conditions, so we
      # need to type check.
      @fz_feed && ! @fz_feed.is_a?(Fixnum)
    end

    private

    def cache_key
      url
    end
  end
end
