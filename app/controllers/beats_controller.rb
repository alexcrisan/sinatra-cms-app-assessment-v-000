class BeatsController < ApplicationController
  get '/beats' do
    if logged_in?
      @user = current_user
      @beats = Beat.all
      erb :'/beats/beats'
    else
      redirect '/login'
    end
  end




end
