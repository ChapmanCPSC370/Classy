class LearningResourcesController < ApplicationController
  before_action :set_learning_resource, only: [:show, :edit, :update, :destroy]

  # GET /learning_resources
  # GET /learning_resources.json
  def index
    @learning_resources = LearningResource.all
  end

  # GET /learning_resources/1
  # GET /learning_resources/1.json
  def show
  end

  # GET /learning_resources/new
  def new
    @learning_resource = LearningResource.new
  end

  # GET /learning_resources/1/edit
  def edit
  end

  # POST /learning_resources
  # POST /learning_resources.json
  def create
    @section = Section.find(params[:section_id])
    @learning_resource = @section.learning_resources.new(learning_resource_params)

    respond_to do |format|
      if @learning_resource.save
        format.html { redirect_to @section, notice: 'Learning resource was successfully created.' }
        format.json { render :show, status: :created, location: @learning_resource }
      else
        format.html { render :new }
        format.json { render json: @learning_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learning_resources/1
  # PATCH/PUT /learning_resources/1.json
  def update
    respond_to do |format|
      if @learning_resource.update(learning_resource_params)
        format.html { redirect_to @learning_resource, notice: 'Learning resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @learning_resource }
      else
        format.html { render :edit }
        format.json { render json: @learning_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learning_resources/1
  # DELETE /learning_resources/1.json
  def destroy
    @learning_resource.destroy
    respond_to do |format|
      format.html { redirect_to learning_resources_url, notice: 'Learning resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning_resource
      @learning_resource = LearningResource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learning_resource_params
      params.require(:learning_resource).permit(:name, :resourceurl, :description, :section_id)
    end
end
