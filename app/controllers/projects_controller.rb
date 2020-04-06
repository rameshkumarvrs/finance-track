class ProjectsController < ApplicationController
  def add_projects
    
  end

  def create
    @project = Project.create(user: current_user, category_id: params[:project][:category], name: params[:project][:name])
    flash[:notice] = "The #{@project.name} was added succesfully in your portfolio"
    redirect_to projects_path
  end

  def index
   @projects = current_user.projects
  end
  
  def new
    @category = Category.all.map { |category| [category.name, category.id]  }
    
  end  


  private



  def projects_params
    params.require(:projects).permit(:name, :category)
  end

end
