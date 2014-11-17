class StaticPagesController < ApplicationController
  def home
    @users = User.all
    @universities = University.all
    
    @autocomplete_items = Section.all
    @autocomplete_majors = Major.all
    @autocomplete_courses = Course.all
  end
  
  def company
    
  end

  def about
     @universities = University.all
  end
end
