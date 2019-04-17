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
      pars_json = response.parsed_response
      pars_json['articles'].each do |k|
        @source = ActiveModel::Source.create(google_id: k["id"], name: k["name"])
        @article = Article.create(title: k["title"], source_id: k["source_id"],
                                  description: k["description"], content: k["content"])
       # @article = Article.create(title: k["title"], source_id: k["source_id"])
      end
    end  
end

