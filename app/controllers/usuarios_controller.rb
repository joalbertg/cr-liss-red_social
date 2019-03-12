# frozen_string_literal: true

# users
class UsuariosController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!, only: [:update]
  before_action :authenticate_owner!, only: [:update]

  def show
    @are_friends = current_user.my_friend?(@user)
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user }
        format.json { render :show }
        format.js
      else
        format.html { redirect_to @user, notice: @user.errors.full_messages }
        format.html { render @user.errors }
      end
    end
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def authenticate_owner!
    return if current_user == @user

    redirect_to root_path, notice: 'No estás autorizado', status: :unauthorized
  end

  def user_params
    params.require(:user).permit(
      :name,
      :last_name,
      :username,
      :email,
      :bio,
      :avatar,
      :cover
    )
  end
end
