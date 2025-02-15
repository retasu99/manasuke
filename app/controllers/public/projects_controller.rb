class Public::ProjectsController < ApplicationController
  
  def index
    @projects = Project.all
  end

end
