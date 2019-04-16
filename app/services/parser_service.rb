class ParserService
  include HTTParty
  API_KEY = '882e10dd2b474a23bb7a3efa85e66b61'.freeze
  base_uri 'https://newsapi.org/v2/'
  default_params fielsd: "title, description, ulr, content"
  format :json

  def self.top_headlines(country_name) 
    new(country_name).top_headlines
  end

  def initialize(country_name)
    @options = { query: { country: country_name, apiKey: API_KEY} }
  end

  def top_headlines 
    response = self.class.get("/top-headlines", @options)
  end
end
