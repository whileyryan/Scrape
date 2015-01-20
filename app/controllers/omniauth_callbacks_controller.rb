class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def yahoo
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    p request.env["omniauth.auth"]
    # @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Yahoo") if is_navigational_format?
    end
  end
end