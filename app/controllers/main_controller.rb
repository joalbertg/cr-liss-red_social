# frozen_string_literal: true

# main
class MainController < ApplicationController
  def home
    @post = Post.new
    @posts = Post.all_for_user(current_user).recent
  end

  def unregistered; end

  protected

  def set_layout
    action_name == 'unregistered' ? 'landing' : super
  end
end
