class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all
    render({ :template => "director_templates/index.html.erb"})
  end

  def oldest
    @oldest = Director.where.not({ :dob => nil}).order({ :dob => :asc}).at(0)
    @list_of_directors = Director.all
    render({ :template => "director_templates/eldest.html.erb"})
  end

  def youngest
    @youngest = Director.where.not({ :dob => nil}).order({ :dob => :desc}).at(0)
    @list_of_directors = Director.all
    render({ :template => "director_templates/youngest.html.erb"})
  end

  def director_details
    dirid = params.fetch("an_id")
    @dirdet = Director.where({ :id => dirid}).at(0)
    @filmo = Movie.where({ :director_id => dirid})
 
    render({ :template => "director_templates/show.html.erb"})
  end
end