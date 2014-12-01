class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!
  
  def upvote
    @review = Review.find(params[:review_id])
    @review.upvote
    redirect_to Section.find(@review.section_id)
  end
  
  def downvote
    @review = Review.find(params[:review_id])
    @review.downvote
    redirect_to Section.find(@review.section_id)
  end
  
  
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
    @section = Section.find(@review.section_id)
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @section = Section.find(params[:section_id])
    @review = @section.reviews.new(review_params)
   # @section = @review.section

    respond_to do |format|
      if @review.save
        format.html { redirect_to @section, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { redirect_to @section, notice: 'Review could not be created.' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    @section = Section.find(@review.section_id)
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @section, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:semester_year, :section_id, :semester, :rating, :description, :name, :user_id)
    end
end
