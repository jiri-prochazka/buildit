class ConceptsController < ApplicationController
  before_action :set_concept, only: [:show, :edit, :update, :destroy, :archive]
  load_and_authorize_resource

  # GET /concepts
  # GET /concepts.json
  def index
    #@concepts = @concept.paginate
    @concept = Concept.new
  end

  # GET /concepts/new
  def new
    @concept = Concept.new
  end

  # GET /concepts/1/edit
  def edit

    respond_to :js 
  end

  # POST /concepts
  # POST /concepts.json
  def create
    @concept = Concept.new(concept_params)
    @concept.user = current_user
    respond_to do |format|
      if @concept.save
        format.html { redirect_to concepts_url, notice: 'Concept was successfully created.' }
        format.json { render :show, status: :created, location: @concept }
      else
        format.html { render :new }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concepts/1
  # PATCH/PUT /concepts/1.json
  def update
    respond_to do |format|
      if @concept.update(concept_params)
        format.html { redirect_to concepts_url, notice: 'Concept was successfully updated.' }
        format.json { render :show, status: :ok, location: @concept }
      else
        format.html { render :edit }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concepts/1
  # DELETE /concepts/1.json
  def destroy
    @concept.destroy
    respond_to do |format|
      format.html { redirect_to concepts_url, notice: 'Concept was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def archive
    @concept.archived = !@concept.archived
    @concept.save
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concept
      @concept = Concept.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concept_params
      params.require(:concept).permit(:name, :price, :start_at, :end_at, :description)
    end
end
