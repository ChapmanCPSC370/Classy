class StaticPagesController < ApplicationController
  def home
    @users = User.all
    @universities = University.all
  end

  def about
     @universities = University.all
  end
end
