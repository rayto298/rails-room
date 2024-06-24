class ArticleImporter
  def initialize(api_token)
    @qiita_service = QiitaService.new(api_token)
  end

  def import(tag)
    response = @qiita_service.fetch_articles(tag)
    if response.success?
      response.parsed_response.each do |article_data|
        Article.find_or_create_by(
          title: article_data["title"],
          url: article_data["url"],
          post_datetime: article_data["created_at"]
        )
      end
    else
      Rails.logger.error "Failed to fetch articles from Qiita: #{response.message}"
    end
  end
end