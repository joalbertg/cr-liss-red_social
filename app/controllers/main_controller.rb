class MainController < ApplicationController
  def home; end

  def unregistered; end

  protected

  def set_layout
    (action_name == 'unregistered') ? 'landing' : super
  end
end
