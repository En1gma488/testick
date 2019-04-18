class ParserService
  include HTTParty
  API_KEY = '882e10dd2b474a23bb7a3efa85e66b61'.freeze
  base_uri 'https://newsapi.org/v2/'
  default_params fielsd: "title, description, ulr, content"
  format :json

  def self.top_headlines(country_name='us') 
    new(country_name).top_headlines
  end

  def initialize(country_name='us')
    @options = { query: { country: country_name, apiKey: API_KEY} }
  end

  def top_headlines 
      response = self.class.get("/top-headlines", @options)
      @pars_json = response.parsed_response
  end

  def render_article
    top_headlines
    @pars_json["articles"].each do |k|
      @source = NewsSource.find_or_create_by!(name: k["name"])
    end
  end

  def render_source
    top_headlines
    @pars_json["articles"].each do |k|
        @articles = Article.find_or_create_by(title: k["title"],
                                               source_id: NewsSource.find_by_name(k["name"]),
                                               content: k["content"],
                                               description: k["description"])
    end
  end

end

