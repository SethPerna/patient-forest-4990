class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = Actor.in_order.all
    @average = Actor.average_age 
  end
end
