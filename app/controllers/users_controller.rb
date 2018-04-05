class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/create_user'
  end

  post '/signup' do
    if params[:username] && params[:email] && params[:password] #if all fields are filled out, proceed to block
      if !User.find_by(username: params[:username]) #if username doesn't exist, create user and redirect /beats
        @user = User.create(params)
        session[:user_id] = @user.id
        redirect '/beats'
      else #if username does exist, redirect to login page.
        redirect '/login'
      end
    else #if all fields aren't filled out, reload the signup page.
      redirect '/signup'
    end
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password]) #if user isn't empty and the user's password matches
      session[:user_id] = user.id #set the current session's :user_id to the user's id. (login)
      redirect '/beats'
    else
      redirect '/signup' #if the user cannot be found, redirect to login page
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
