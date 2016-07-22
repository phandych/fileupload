class CoursesController < ApplicationController
  def index
  	@courses = Course.all
  end

  def create
  	@course = Course.create(course_params)
  	if @course.save
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { render json: @course.to_jq_upload }
      end
    end
  end

  private

  	def course_params
  		params.require(:course).permit(:name, :upload)
  	end
end
