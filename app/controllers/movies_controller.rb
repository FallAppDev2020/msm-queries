class MoviesController < ApplicationController

  def index
    @list_of_movies = Movie.all
    render({ :template => "movie_templates/index.html.erb"})
  end

    def movie_details
    movid = params.fetch("an_id")
    @movdet = Movie.where({ :id => movid}).at(0)
    render({ :template => "movie_templates/show.html.erb"})
  end
  
end