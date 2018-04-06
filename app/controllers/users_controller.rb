require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash
  get '/signup' do
    erb :'/users/create_user'
  end

  post '/signup' do
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty? #if all fields are filled out, proceed to block
      if !User.find_by(username: params[:username]) #if username doesn't exist, create user and redirect /beats
        @user = User.create(params)
        session[:user_id] = @user.id
        redirect '/beats'
      else #if username does exist, redirect to login page.
        flash[:message] = "Username already registered."
        redirect '/login'
      end
    else #if all fields aren't filled out, reload the signup page.
      flash[:message] = "Please fill out all form items."
      redirect '/signup'
    end
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password]) #if user is found and the user's password matches
      session[:user_id] = user.id #set the current session's :user_id to the user's id. (login)
      redirect '/beats'
    else
      flash[:message] = "User/password combination cannot be found."
      redirect '/signup' #if the user cannot be found, redirect to signup page
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end

end
