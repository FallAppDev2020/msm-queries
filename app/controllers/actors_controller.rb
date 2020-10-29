class ActorsController < ApplicationController

  def index
    @list_of_actors = Actor.all
    render({ :template => "actor_templates/index.html.erb"})
  end

    def actor_details
    actid = params.fetch("an_id")
    @actdet = Actor.where({ :id => actid}).at(0)
    @filmo = Character.where({ :actor_id => actid})
    render({ :template => "actor_templates/show.html.erb"})
  end

end