class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :archive]

  # GET /projects
  # GET /projects.json
  def index
    if params[:cat].eql?('completed')
      @projects = Project.where.not(completed_at: nil)
    elsif params[:cat].eql?('archived')
      @projects = Project.where(archived: true)
    else
      @projects = Project.where(completed_at: nil, archived: false)
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @concept = @project.concept
    @requirements = @project.requirements.to_a
    @requirement = @project.requirements.build
  end

  # GET /projects/new
  def new
    unless params[:concept_id].blank?
      @project = Project.new
      @concept = Concept.find(params[:concept_id])
    else
      redirect_to concepts_path, alert: "Can't create project without a concept"
    end
  end

  # GET /projects/1/edit
  def edit
    @concept = @project.concept
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @concept = Concept.find(params[:concept_id])
    @project.concept = @concept
    @project.employee = current_user
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @concept = @project.concept
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def archive
    @project.archived = !@project.archived
    @project.save
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :estimated_finish, :completed_at, :archived, jobs_attributes: [:id, :_destroy, :name, :description, :confirmed_at, :progress, :estimated_time, :estimated_price, :real_price, :completed_at, attachments_attributes: [:name,:file]])
    end
end
