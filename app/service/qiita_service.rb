require 'httparty'

class QiitaService
  include HTTParty
  base_uri 'https://qiita.com/api/v2'

  def initialize(api_token)
    @options = { headers: { "Authorization" => "Bearer #{api_token}" } }
  end

  def fetch_articles(tag, per_page = 20)
    self.class.get("/items", query: { query: "tag:#{tag}", per_page: per_page }, **@options)
  end
end