enable :sessions
get '/session_viewer' do
  session.inspect
end

get '/users' do

end

get '/users/new' do      #return HTML for new user
end

post '/users' do         #post for create new user
end

get '/users/:id' do      #get specific user
end

get '/users/:id/edit' do  #send form for editing user
end

put '/users/:id' do      #update a user's record

end

delete '/users/:id' do       #delete a user's record

end

get '/' do
  if session[:user_id]
    # user = User.find(session[:user_id])
    # @username = user.username
    @songs = Song.all
    erb :song_search
  else
    erb :login
  end
end

get '/users/login' do
  if session[:user_id]
    # user = User.find(session[:user_id])
    # @username = user.username
    @songs = Song.all
    erb :song_search
  else
    erb :login
  end
end

get '/users/logout' do
  session[:user_id] = nil
  redirect '/users/login'
end

post '/users/login' do
  user = User.find_by(username: params[:username])
  if user && (user.password == params[:password])
    session[:user_id] = user.id
    @songs = Song.all
    erb :song_search
  else
    @error = "Username or password invalid."
    erb :login
  end
end

get '/users/signup' do
  session[:user_id] = nil
  erb :signup
end

post '/users/signup' do
  if params[:password] == params[:verify_password]
    new_user = User.new(
        username: params[:username],
        email: params[:email],
        phone_number: params[:phone_number],
        password: params[:password])
    new_user.password = params[:password]
    if new_user.save
      session[:user_id] = new_user.id
      @songs = Song.all
      erb :song_search

    else
      @signup_errors = new_user.errors.messages
      erb :signup
    end
  else
    @error = "Your passwords don't match."
    erb :signup
  end
end


get '/users/index' do
  erb :show_sots

end

