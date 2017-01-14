class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_enrolled, :only => [:show]

  def show
  end

  private

  helper_method :current_lesson

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def current_course
    current_section.course
  end

  def current_section
    current_lesson.section
  end

  def current_user_enrolled
    unless current_user.enrolled_in?(current_course)
      error = "You are not enrolled in this course."
      redirect_to course_path(current_course), alert: error
    end
  end

end
