class UsersController < ApplicationController
  get '/users' do
    redirect '/' #redirect to index page in application controller
  end

  get '/signup' do
    erb :'/users/create_user'
  end

  post '/signup' do
    if params[:username] && params[:email] && params[:password] #if all fields are filled out, proceed to block
      if !User.find_by(username: params[:username]) #if username doesn't exist, create user and redirect /beats
        @user = User.create(params)
        session[:id] = @user.id
        redirect '/beats'
      else #if username does exist, redirect to login page.
        redirect '/users/login'
      end
    else #if all fields aren't filled out, reload the signup page.
      redirect '/signup'
    end
  end

  get '/users/login' do
    erb :'/users/login'
  end

  get '/users/:username' do #display user's beats
    @user = User.find_by(username: params[:username])
    erb :'/users/show'
  end


end
