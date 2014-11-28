class SchoolRequestsController < ApplicationController
  before_action :set_school_request, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!
  # GET /school_requests
  # GET /school_requests.json
  def index
    @school_requests = SchoolRequest.all
  end

  # GET /school_requests/1
  # GET /school_requests/1.json
  def show
  end

  # GET /school_requests/new
  def new
    @school_request = SchoolRequest.new
  end

  # GET /school_requests/1/edit
  def edit
  end

  # POST /school_requests
  # POST /school_requests.json
  def create
    @school_request = SchoolRequest.new(school_request_params)

    respond_to do |format|
      if @school_request.save
        format.html { redirect_to @school_request, notice: 'School request was successfully created.' }
        format.json { render :show, status: :created, location: @school_request }
      else
        format.html { render :new }
        format.json { render json: @school_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_requests/1
  # PATCH/PUT /school_requests/1.json
  def update
    respond_to do |format|
      if @school_request.update(school_request_params)
        format.html { redirect_to @school_request, notice: 'School request was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_request }
      else
        format.html { render :edit }
        format.json { render json: @school_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_requests/1
  # DELETE /school_requests/1.json
  def destroy
    @school_request.destroy
    respond_to do |format|
      format.html { redirect_to school_requests_url, notice: 'School request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_request
      @school_request = SchoolRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_request_params
      params.require(:school_request).permit(:user_id, :school_name, :number_requests)
    end
end
