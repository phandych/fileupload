class CoursesController < ApplicationController
  def index
  	@courses = Course.order(id: :desc)
  end
  
  def new
    @course = Course.new
    @course_upload = @course.course_uploads.build
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
  		params.require(:course).permit(:name, course_uploads_attributes: [:id, :upload, :base])
  	end
end
