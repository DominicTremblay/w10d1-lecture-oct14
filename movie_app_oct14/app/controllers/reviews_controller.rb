class ReviewsController < ApplicationController
  def create

    @movie = Movie.find(params[:movie_id])

    @review = @movie.reviews.new(review_params)

    if @review.save

      redirect_to @movie, notice: 'Review created'

    else

      redirect_to @movie, notice: 'Review could not be created'
      
    end


  end

  def destroy
  end

  private

  def review_params

    params.require(:review).permit(
      :rating,
      :comment
    )
  end
end
