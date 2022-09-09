class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  ## get all the songs and display them all, alphabetical order
  ## also includes the Artist and Genre for each
  get "/songs" do
    songs = Song.all.order(:name)
    songs.to_json(include: [:artist, :genre, :reviews])
  end

  ## post a new song
  post "/songs" do
    artist = Artist.find_or_create_by(name: (params[:artist][:name]))
    genre = Genre.find_or_create_by(name: params[:genre][:name])
    artist.update(
      name: params[:artist][:name],
    )
    genre.update(
      name: params[:genre][:name],
    )
    song = Song.create(
      name: params[:name],
      year: params[:year],
      artist_id: artist.id,
      genre_id: genre.id,
    )
    song.to_json(include: [:artist, :genre, :reviews])
  end

  ## update the genre of a song
  patch "/songs/:id" do
    song = Song.find(params[:id])
    genre = Genre.find_or_create_by(name: params[:genre][:name])
    genre.update(
      name: params[:genre][:name],
    )
    song.update(
      genre_id: genre.id,
    )
    song.to_json(include: [:artist, :genre, :reviews])
  end

  ## delete a song from the display
  delete "/songs/:id" do
    song = Song.find(params[:id])
    song.destroy
    song.to_json(include: [:artist, :genre, :reviews])
  end

  ## get all the artists in an array, alphabetical order
  get "/artists" do
    artist = Artist.all.order(:name)
    artist.to_json
  end

  ## get all the genres in an array, alphabetical order
  get "/genres" do
    genre = Genre.all.order(:name)
    genre.to_json
  end

  ## FOR REVIEWS

  ## get all the reviews and display them all
  get "/reviews" do
    reviews = Review.all
    reviews.to_json
  end

  ## post a new review -- initialized with 0 likes & 0 dislikes
  post "/reviews" do
    review = Review.create(
      likes: 0,
      dislikes: 0,
      comment: params[:comment],
      song_id: params[:song_id],
    )
    review.to_json
  end

  ## update the likes and/or dislikes count for the review
  patch "/reviews/:id" do
    review = Review.find(params[:id])
    review.update(
      likes: params[:likes],
      dislikes: params[:dislikes],
    )
    review.to_json
  end
end
