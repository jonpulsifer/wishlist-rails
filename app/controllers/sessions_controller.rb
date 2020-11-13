# typed: false
# frozen_string_literal: true

class SessionsController < ApplicationController
  layout "login"

  def new
    # No need for anything in here, we are just going to render our
    # new.html.erb AKA the login page
  end

  def create
    # Look up User in db by the email address submitted to the login form and
    # convert to lowercase to match email in db in case they had caps lock on:
    user = User.find_by(name: params[:session][:name].downcase)

    # Verify user exists in db and run has_secure_password's .authenticate()
    # method to see if the password submitted on the login form was correct:
    if user&.authenticate(params[:session][:password])
      # Save the user.id in that user's session cookie:
      session[:user_id] = user.id
      redirect_to(user, notice: 'Successfully logged in!')
    else
      # if email or password incorrect, re-render login page:
      flash.now[:error] = 'Incorrect name or password, try again.'
      render(:new)
    end
  end

  def destroy
    # delete the saved user_id key/value from the cookie:
    session.delete(:user_id)
    redirect_to(login_url, notice: 'Logged out!')
  end
end
