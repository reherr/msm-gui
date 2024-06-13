class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    m = Movie.new
    m.title = params("the_title")
    m.year = params("the_year")
    m.duration = params("the_duration")
    m.description = params("the_description")
    m.image = params("the_image")
    m.director_id = params("the_director_id")

    m.save

    redirect_to("/movies")
  end

  def destroy
    the_id = params.fetch("an_id")

    matching_records = Movie.where({ :id => the_id })

    the_movie = matching_records.at(0)

    the_movie.destroy

    redirect_to("/movies")
  end

  def update 
    m_id = params.fetch("the_id")

    matching_records = Movie.where({ :id => m_id })

    the_movie = matching_records.at(0)

    the_movie.title = params("the_title")
    the_movie.year = params("the_year")
    the_movie.duration = params("the_duration")
    the_movie.description = params("the_description")
    the_movie.image = params("the_image")
    the_movie.director_id = params("the_director_id")

    the_movie.save

    redirect_to("/movies/#{the_movie.id}")
  end
end
