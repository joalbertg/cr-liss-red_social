class MainController < ApplicationController
  def home
    @post = Post.new
  end

  def unregistered; end

  protected

  def set_layout
    (action_name == 'unregistered') ? 'landing' : super
  end
end
