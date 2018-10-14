require 'json'
require 'faraday'

# Service for HN algolia API connection and search
class HackerNewsSearcher
  API_SEARCH_URL = 'https://hn.algolia.com'.freeze
  ConnectionError = Class.new(StandardError)

  def initialize(query, page_number = 0)
    @query = query
    @page_number = page_number
    @connection = connection
  end

  def call
    JSON.parse(search)
  end

  private

  def search
    response = @connection.get do |req|
      req.url 'api/v1/search', query: @query, page: @page_number
    end
    raise ConnectionError unless response.success?
    response.body
  end

  def connection
    @connection ||= Faraday.new(url: API_SEARCH_URL) do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end
end
