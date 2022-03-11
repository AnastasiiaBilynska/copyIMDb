class MoviesController < ApplicationController
  # before_action :find_movie, only: [:show]

  def index
    if params[:category].blank?
      @pagy, @movies = pagy Movie.all.order('created_at DESC')
    else
      @category_id = Category.find_by(name: params[:category]).id
      @pagy, @movies = pagy Movie.where(:category_id => @category_id).order('created_at DESC')
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :text, :category_id, :preview)
  end

  # def find_movie
  #   @movie = Movie.find(params[:id])
  # end

end
