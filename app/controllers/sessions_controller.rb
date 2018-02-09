class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]

  def new
   # mostrar vista sessions/new (/login)
  end

 def create
  reviewer = Reviewer.find_by(email: params[:reviewer][:email])
  password = params[:reviewer][:password]
  if reviewer && reviewer.authenticate(password)
   session[:reviewer_id] = reviewer.id
   redirect_to books_path, notice: "Login correcto."
  else
   redirect_to login_path, alert: "Login incorrecto."
  end
 end

 def destroy
  reset_session
  redirect_to root_path, notice: "Te has deslogueado correctamente!"
 end
end
