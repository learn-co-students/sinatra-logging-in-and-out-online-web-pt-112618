require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.findby(:username => params[:username])
    if @user != nil && params[:password] == @user.password
      session[:user_id] = @user.id
      redirect_to '/account'
    end
    erb :error
  end

  get '/account' do

  end

  get '/logout' do
    session.clear
    redirect_to '/'
  end


end

