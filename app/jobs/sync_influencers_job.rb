class SyncInfluencersJob
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 0

  def perform(platform)
    InfluencerSyncService.new(platform).sync

    influencers = Influencer.all

    rendered_partial = ApplicationController.render(
      partial: "influencers/list",
      locals: { influencers: influencers }
    )

    turbo_stream_message = <<~HTML
      <turbo-stream action="replace" target="influencers_list">
        <template>
          #{rendered_partial}
        </template>
      </turbo-stream>
    HTML

    ActionCable.server.broadcast("influencers:influencers", { turbo_stream: turbo_stream_message })
  end
end
