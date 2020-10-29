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
end