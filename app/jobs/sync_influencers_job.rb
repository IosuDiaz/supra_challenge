class SyncInfluencersJob
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 0

  def perform(platform)
    InfluencerSyncService.new(platform).sync

    html = ApplicationController.renderer.render(
      partial: "influencers/list",
      locals: { influencers: Influencer.all }
    )

    turbo_stream = ApplicationController.renderer.render(
      turbo_stream: turbo_stream_action(html)
    )

    ActionCable.server.broadcast("influencers", turbo_stream)
  end

  private

  def turbo_stream_action(html)
    Turbo::StreamsChannel.broadcast_replace_to(
      "influencers",
      target: "influencers_list",
      partial: "influencers/list",
      locals: { influencers: Influencer.all }
    )
  end
end
