# frozen_string_literal: true

# service
class PostService
  def initialize(params, current_user)
    @user = current_user
    @post = @user.posts.new(params)
  end

  def create_object
    if @post.save
      @post.send_notification_to_users # concern
      send_to_action_cable
      return true
    end
    false
  end

  def object
    @post
  end

  def errors
    @post.errors
  end

  private

  # after_create :send_to_action_cable
  def send_to_action_cable
    send_to_friends(@user.friend_ids)
    send_to_friends(@user.user_ids)
  end

  def send_to_friends(ids)
    data = { message: to_html, action: 'new_post' }
    ids.each { |id| data_broadcast(id, data) }
  end

  def data_broadcast(friend_id, data)
    ActionCable.server.broadcast("posts_#{friend_id}", data)
  end

  def to_html
    ApplicationController.renderer.render(partial: 'posts/post',
                                          locals: { post: @post })
    # locals: local variables used by the partial
  end
end
