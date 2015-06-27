enable :sessions
get '/pdftest' do
    erb :pdf

end

get '/songs/new' do

end

get '/songs/:id' do
  redirect  '/songs/search'
end

post '/songs'do

end

get '/songs/:id/edit' do

end

put '/users/:id/' do

end

#songs/search might be songs
get '/songs' do
  if !session[:user_id]
    @error = "You must be logged in to search for music."
    redirect to '/users/login'
  else
    @songs = Song.all
    p @songs
    erb :song_search
  end
end

post '/songs/search' do
  title = params[:title]
  composer = params[:composer]
  larger_work = params[:larger_work]
  arranger_one = params[:arranger_one]
  arranger_two = params[:arranger_two]
  voicing = params[:voicing]
  description = params[:description]
  options_string = ""
  options_params = []
  params.each do |key, value|
    puts "key: #{key}   value: #{value}"
    if value.length != 0
      if options_string.length != 0
        options_string << " and "
      end
      options_string <<  key.to_s + " like ?"
      options_params << '%' + value + '%'
    end
  end

  @songs = Song.where(options_string, *options_params)
  #Song.where("title like ? and description like ?", titleval, descval).to_sql
  #@songs = Song.where("title like ?" , '%Noel%')
 @songs.each do |song| puts song.inspect end

    erb :song_search
end