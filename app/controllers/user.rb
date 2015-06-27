enable :sessions
get '/session_viewer' do
  session.inspect
end

get '/users' do

end

get '/users/new' do
  session[:user_id] = nil
  erb :signup
end

get '/users/:id' do #get specific user
end

get '/users/:id/edit' do #send form for editing user
end

put '/users/:id' do #update a user's record

end

delete '/users/:id' do #delete a user's record

end




post '/users' do
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

