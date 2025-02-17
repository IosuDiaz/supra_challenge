class InfluencersChannel < ApplicationCable::Channel
  def subscribed
    stream_for "influencers"
  end

  def unsubscribed
  end
end
