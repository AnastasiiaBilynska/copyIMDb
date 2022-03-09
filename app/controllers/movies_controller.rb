class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]
  before_action :find_categories, only: [:new, :edit]


    def index
      if params[:category].blank?
        @movies = Movie.all.order('created_at DESC')
      else
        @category_id = Category.find_by(name: params[:category]).id
        @movies = Movie.where(:category_id => @category_id).order('created_at DESC')
      end
    end

    def new
      @movie = Movie.new
    end

    def create
      @movie = Movie.new(movie_params)
      @movie.category_id = params[:category_id]

      if @movie.save
        flash[:success] = "Movie has been successfully created!"
        redirect_to root_path
      else
        render 'new'
      end
    end

    def show
    end

    def edit
    end

    def update
      @movie.category_id = params[:category_id]
      if @movie.update(movie_params)
        flash[:success] = "Movie has been successfully updated!"
        redirect_to movie_path(@movie)
      else
        render 'edit'
      end
    end

    def destroy
      @movie.destroy
      flash[:success] = "Movie has been successfully deleted!"
      redirect_to root_path
    end

    private

    def movie_params
      params.require(:movie).permit(:title, :text, :category_id, :preview)
    end

    def find_movie
      @movie = Movie.find(params[:id])
    end

    def find_categories
      @categories = Category.all.map{ |c| [c.name, c.id] }
    end
end
