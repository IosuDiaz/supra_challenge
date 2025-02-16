# app/services/influencer_api_client.rb
require "httparty"

class InfluencerApiClient
  include HTTParty
  base_uri "https://private-8dfc0d-modashmock.apiary-mock.com"

  def initialize(platform)
    @platform = platform
  end

  def fetch_all
    response = get_influencers
    parse_response(response)
  end

  private

  def get_influencers
    self.class.get("/#{@platform}/users", headers: { "Authorization" => "Bearer #{Rails.application.credentials.modash_api_key}" })
  end

  def parse_response(response)
    puts response.response
    if response.success?
      response.parsed_response["users"]
    else
      []
    end
  end
end
