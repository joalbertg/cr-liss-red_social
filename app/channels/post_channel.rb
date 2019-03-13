# frozen_string_literal: true

# PostChannel
class PostChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'some_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def echo(data)
    ActionCable.server.broadcast 'some_channel', data
  end
end
