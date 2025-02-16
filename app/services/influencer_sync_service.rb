class InfluencerSyncService
  PLATFORMS = %w[instagram tiktok youtube].freeze

  def self.sync_all
    PLATFORMS.each do |platform|
      SyncInfluencersJob.perform_async(platform)
    end
  end

  def initialize(platform)
    @platform = platform
  end

  def sync
    influencers = fetch_influencers
    store_influencers(influencers) if influencers.any?
  end

  private

  def fetch_influencers
    InfluencerApiClient.new(@platform).fetch_all
  end

  def store_influencers(influencers)
    influencer_data = influencers.map do |data|
      {
        external_id: data["userId"],
        username: data["username"],
        fullname: data["fullname"],
        verified: data["isVerified"],
        picture: data["picture"],
        platform: @platform,
        followers: data["followers"]
      }
    end

    Influencer.upsert_all(influencer_data, unique_by: [ :external_id, :platform ]) if influencer_data.any?
  end
end
