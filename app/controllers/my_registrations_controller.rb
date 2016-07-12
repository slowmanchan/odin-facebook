class MyRegistrationsController < Devise::RegistrationsController
  def create
    super
    if @user.persisted?
      Users.welcome_email(@user).deliver_now
    end
  end
end
