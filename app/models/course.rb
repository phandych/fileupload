class Course < ActiveRecord::Base
  has_many :course_uploads
  accepts_nested_attributes_for :course_uploads, allow_destroy: true
end
