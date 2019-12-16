require 'faker'

Review.destroy_all
Movie.destroy_all

Movie.create!({
  title: "Avengers End Game", 
  director: 'Russo', 
  runtime_in_minutes: 181, 
  image_url: 'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SY1000_CR0,0,674,1000_AL_.jpg',
  description: "the Avengers must assemble once more in order to undo Thanos's actions", 
  release_date: Date.new(2019,04,26).to_formatted_s(:long_ordinal) })

Movie.create!({
  title: "Spider-Man: Far from Home", 
  director: 'Jon Watts', 
  runtime_in_minutes: 129, 
  image_url: 'https://m.media-amazon.com/images/M/MV5BMGZlNTY1ZWUtYTMzNC00ZjUyLWE0MjQtMTMxN2E3ODYxMWVmXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_SY1000_CR0,0,674,1000_AL_.jpg',
  description: "Peter meets Fury and partners with Mysterio to take down the creatures before they harm anyone else", 
  release_date: '2019-07-02'})

Movie.create!({
  title: "John Wick: Chapter 3 - Parabellum", 
  director: 'Chad Stahelski', 
  runtime_in_minutes: 131, 
  image_url: 'https://m.media-amazon.com/images/M/MV5BMDg2YzI0ODctYjliMy00NTU0LTkxODYtYTNkNjQwMzVmOTcxXkEyXkFqcGdeQXVyNjg2NjQwMDQ@._V1_SY1000_CR0,0,648,1000_AL_.jpg',
  description: "After killing a member of the shadowy international assassin's guild, the High Table, John Wick is excommunicado", 
  release_date: '2019-06-17'})  

  # Generating 5 reviews for each movie
Movie.all.each do |movie|
  5.times do
    # creating a review associated with that movie
    movie.reviews.create!(
      rating: rand(10) + 1, 
      comment: Faker::TvShows::GameOfThrones.quote)
  end
end
