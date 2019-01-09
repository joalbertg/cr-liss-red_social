class UsuariosController < ApplicationController
  before_action :set_user
  def show; end

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

  def user_params
    params.require(:user).permit(:name, 
                                  :last_name, 
                                  :username, 
                                  :email, 
                                  :bio)
  end
end
