class ReviewersController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]  

  def new
    @reviewer = Reviewer.new
  end

  def create
    @reviewer = Reviewer.new(user_params)
    if !verify_recaptcha(model: @reviewer) || !@reviewer.save
      render "new"
    end
  end

private
  def user_params
    params.require(:reviewer).permit(:name, :email, :password, :password_confirmation)
  end
end
