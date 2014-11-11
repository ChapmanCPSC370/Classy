class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  # GET /sections
  # GET /sections.json
  def index
   # @course = Course.find(5)
    @sections = Section.all
  end
  
  def import
    Section.import(params[:file])
    redirect_to sections_search_sections_path, notice: "Sections imported."
  end
  
  def all_sections
    @sections = Section.all
  end
  
  def wishlist
    if params[:search]
      #@sections = Section.where(['teacher LIKE ? or room LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%"])
      @sections = Section.where(['section_name_and_title LIKE ? or teacher LIKE ? or room LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%"]).paginate(:page => params[:page], :per_page => 30)
     # @section_majors = Major.where(['name LIKE ?', "%#{params[:search]}%"])
    #  @major_sections = Section.joins(:majors).where(['majors.name LIKE ?', "%#{params[:search]}%"])
    #  @sections = @sections + @major_sections
      @autocomplete_items = Section.all
      @autocomplete_majors = Major.all
      @autocomplete_courses = Course.all
    else
      @sections = Section.paginate(:page => params[:page], :per_page => 30).order('teacher ASC')
      @autocomplete_items = Section.all
      @autocomplete_majors = Major.all
      @autocomplete_courses = Course.all
      respond_with json: @sections
    end
  end
  
  def search_sections
    if params[:search]
      #@sections = Section.where(['teacher LIKE ? or room LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%"])
      @sections = Section.joins(:course).where(['name LIKE ? or teacher LIKE ? or room LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%"])
      @section_majors = Major.where(['name LIKE ?', "%#{params[:search]}%"])
      @major_sections = Section.joins(:majors).where(['majors.name LIKE ?', "%#{params[:search]}%"])
      @sections = @sections + @major_sections
      @autocomplete_items = Section.all
      @autocomplete_majors = Major.all
      @autocomplete_courses = Course.all
    else
      @sections = Section.paginate(:page => params[:page], :per_page => 30).order('teacher ASC')
      @autocomplete_items = Section.all
      @autocomplete_majors = Major.all
      @autocomplete_courses = Course.all
      respond_with json: @sections
    end
  end
  
  def all_sections2
    @sections = Section.all
  end
  
  def students
    @section = Section.find(params[:section_id])
    @students = @section.enrollments
  end
  
  def destroy_multiple
    Section.destroy(params[:sections])

    respond_to do |format|
      format.html { redirect_to sections_edit_all_path }
      format.json { head :no_content }
    end
  end
  
  def edit_all
    @sections = Section.all
  end
  
  def show_sections
    @course = Course.find(params[:course_id])
    @sections = @course.sections
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
  end

  # GET /sections/new
  def new
   #@course = Course.find(params[:course_id])
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.json
  def create   
   # @course = Course.find(params[:course_id])
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to sections_search_sections_path, notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @section, notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_all_sections_path, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:section_name_and_title, :time_start, :time_end, :days_of_class, :course_id, :term, :teacher, :schedule, :room, :start_time, :end_time)
    end
end
