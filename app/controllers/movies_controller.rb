class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = Actor.in_order.all
    @average = Actor.average_age
  end

  def create
    @movie = Movie.find(params[:id])
    actor = Actor.create!(actor_params)
    actor.save
    redirect_to "/movies/#{@movie.id}"
  end

  private
  def actor_params
    params.permit(:name, :age)
  end
end
