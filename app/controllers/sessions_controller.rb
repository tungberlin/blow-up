class SessionsController < ApplicationController
def new
    @title = "Sign in"
  end

  def create
     user = User.authenticate(params[:session][:e_mail],
                             params[:session][:password])
    if user.nil?
      flash[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      # Sign the user in and redirect to the user's show page.
      sign_in user
     #redirect_to user
     
     redirect_to items_path
    end
  end


def destroy
    sign_out
    redirect_to signin_path
  end
  
end
