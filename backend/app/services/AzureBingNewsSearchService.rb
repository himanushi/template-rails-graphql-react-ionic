# frozen_string_literal: true

require 'faraday'
require 'json'

class AzureBingNewsSearchService
  API_ENDPOINT = 'https://api.bing.microsoft.com/v7.0/news/search'
  API_KEY = ENV.fetch('AZURE_BING_SEARCH_API_KEY', nil)

  def self.search(query: 'ニュース', count: 20, offset: 0)
    conn = Faraday.new(url: API_ENDPOINT) do |faraday|
      faraday.headers['Ocp-Apim-Subscription-Key'] = API_KEY
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get do |req|
      req.params['q'] = query
      req.params['count'] = count
      req.params['offset'] = offset
      req.params['sortBy'] = 'Date'
    end

    case response.status
    when 200
      JSON.parse(response.body)
    else
      { error: "Request failed with status code #{response.status}" }
    end
  end
end
