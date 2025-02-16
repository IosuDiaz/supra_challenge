class SyncInfluencersJob
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 0

  def perform(platform)
    InfluencerSyncService.new(platform).sync
  end
end
