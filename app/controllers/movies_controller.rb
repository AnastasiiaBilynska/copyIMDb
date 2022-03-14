class MoviesController < ApplicationController

  def index
    @review = Review.new
    if params[:category].blank?
      @pagy, @movies = pagy Movie.all.order('created_at DESC')
    else
      @category_id = Category.find_by(name: params[:category]).id
      @pagy, @movies = pagy Movie.where(:category_id => @category_id).order('created_at DESC')
    end
  end

  def show
    @movie = Movie.find(params[:id])
    if @movie.reviews.blank?
      @average_review = 0
    else
      @average_review = @movie.reviews.average(:rating).round(2)
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :text, :category_id, :preview)
  end

end
