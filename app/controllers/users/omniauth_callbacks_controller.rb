module Users
  class OmniauthCallbacksController < ApplicationController
    def facebook
      #raise request.env['omniauth.auth'].to_yaml
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted? # return true if exits in the database
        @user.remember_me = true
        sign_in_and_redirect(@user, event: :authentication)
      else
        session['devise.auth'] = request.env['omniauth.auth']
        render :edit
      end
    end

    def custom_sign_up
      @user = User.from_omniauth(session['devise.auth'])
      render :edit and return unless @user.update(user_params)
      sign_in_and_redirect(@user, event: :authentication)
    end

    def failure
      redirect_to(new_user_session_path, notice: "Hubo un error con el login. Intenta de nuevo")
    end

    private

    def user_params
      # Strong Params
      params.require(:user).permit(
        :name, 
        :username, 
        :email
      )
    end
  end
end
