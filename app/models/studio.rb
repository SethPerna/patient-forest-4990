class Studio < ApplicationRecord
  has_many :movies

  def studios_movies
    movies.pluck(:title)
  end
end
