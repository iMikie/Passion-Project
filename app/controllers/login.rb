#sessions********************
get '/' do
  redirect '/login'
end
get '/login' do
  if session[:user_id]
    # user = User.find(session[:user_id])
    # @username = user.username

    @songs = Song.all
    erb :song_search
  else
    erb :login
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/login'
end

post '/login' do

  puts "user: #{User.first}"
  user = User.find_by(username: params[:username])
  puts "1" * 50
  # if !user
  #   @error="Password or username not found."
  #   erb :login
  # else
  if user && (user.password == params[:password])
    puts "2" * 50
    session[:user_id] = user.id
    @songs = Song.all
    erb :song_search
  else

    @error = "Username or password invalid."
    # @login_errors = user.errors.messages
    # puts "3" * 50
    erb :login
  end
end
