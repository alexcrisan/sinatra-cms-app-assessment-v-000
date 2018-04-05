class BeatsController < ApplicationController
  get '/beats' do
    if logged_in?
      @user = current_user
      @beats = current_user.beats
      erb :'/beats/beats'
    else
      redirect '/login'
    end
  end

  get '/beats/new' do
    if logged_in?
      @user = current_user
      @tags = Tag.all
      erb :'/beats/create_beat'
    else
      redirect '/login'
    end
  end

  post '/beats' do
    @beat = Beat.create(name: params[:name])
    if @beat && logged_in?
      if !params[:tag][:name].empty?
        @beat.tags << Tag.create(params[:tag][:name])
      end
      @beat.save
      current_user.beats << @beat
      redirect '/beats'
    elsif !logged_in?
      redirect '/login'
    else
      redirect '/beats'
    end
  end

  get '/beats/:slug' do
    if logged_in?
      @user = current_user
      @beat = Beat.find_by_slug(params[:slug])
      erb :'beats/show_beat'
    else
      redirect '/login'
    end
  end

  get '/beats/:slug/edit' do
    @beat = Beat.find_by_slug(params[:slug])
    erb :'beats/edit_beat'
  end

  patch '/beats/:slug' do
    @beat = Beat.find_by_slug(params[:slug])

  end



end
