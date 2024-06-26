require 'google/apis/youtube_v3'

class YoutubeVideoImporter
  def initialize(api_key)
    @api_key = api_key
    @service = Google::Apis::YoutubeV3::YouTubeService.new
    @service.key = @api_key
  end

  def import(query)
    options = {
      q: query,
      type: 'video',
      max_results: 20,
      order: 'date'
    }

    response = @service.list_searches('snippet', **options)
    response.items.each do |item|
      Video.create(
        title: item.snippet.title,
        url: "https://www.youtube.com/watch?v=#{item.id.video_id}",
        thumbnail_url: item.snippet.thumbnails.default.url,
        publish_datetime: item.snippet.published_at
      )
    end
  end
end