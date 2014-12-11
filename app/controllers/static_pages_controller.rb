class StaticPagesController < ApplicationController
  def home
    @users = User.all
    @universities = University.all
   @autocomplete_items = Section.select(:section_name).distinct
      @autocomplete_subjects = Section.select(:subject).distinct
      @autocomplete_teachers = Section.select(:teacher).distinct
      @autocomplete_majors = Major.all
      @autocomplete_courses = Course.all
  end
  
  def ambassador
    
  end
  
  def company
    
  end
  def help
    
  end

  def about
     @universities = University.all
  end
end
