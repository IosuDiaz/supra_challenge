class InfluencersChannel < ApplicationCable::Channel
  def subscribed
    stream_for "influencers"
  end

  def unsubscribed
    # Cleanup when the user unsubscribes
  end
end
