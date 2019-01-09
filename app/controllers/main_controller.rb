class MainController < ApplicationController
  def home
    @post = Post.new
    @posts = Post.all
  end

  def unregistered; end

  protected

  def set_layout
    (action_name == 'unregistered') ? 'landing' : super
  end
end
