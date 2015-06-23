# enable :sessions
#
# get '/session_viewer' do
#   session.inspect
# end
#
# get '/' do
#   erb :login
# end
#
# get '/users/login' do
#   if session[:user_id]
#     user = User.find(session[:user_id])
#     @username = user.username
#     erb :songs_search
#   else
#     erb :login
#   end
# end
#
#
# post '/users/login' do
#   user = User.find_by(username: params[:username])
#   if user && (user.password == params[:password])
#     session[:user_id] = user.id
#     erb :songs_search
#   else
#     @error = "Username or password invalid."
#     erb :login
#   end
# end